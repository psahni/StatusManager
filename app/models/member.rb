# == Schema Information
#
# Table name: members
#
#  id             :integer          not null, primary key
#  role_id        :integer
#  manager_id     :integer
#  name           :string(255)      not null
#  email          :string(255)      not null
#  gender         :string(10)
#  birthday       :key => "value", date
#  designation    :string(50)
#  avtar          :string(255)
#  active         :boolean          default(FALSE)
#  last_logged_in :datetime
#  soft_delete    :boolean          default(FALSE)
#  created_at     :datetime
#  updated_at     :datetime
#  team_id        :integer
#

class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutableand :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable


  attr_accessor :current_team_id, :team_name

  # Validations
  validates :name, :presence => true, :uniqueness => true
  validates :team_name, :presence => true, :if => lambda{|member| member.new_record? && member.admin? }
  validates_confirmation_of :password

  # Associations
  has_many :teams_members, 
            class_name: "TeamsMembers",
            dependent: :destroy 
  has_many :teams, 
           :through => :teams_members, 
           :dependent => :destroy,
           :inverse_of => :members,
           dependent: :destroy

  has_many :statuses
  belongs_to :company, :inverse_of => :members
  belongs_to :role



  ##
  ## => CALLBACKS
  ##
  before_validation :assign_random_password,  :on => :create

  before_create  :add_standup_token
  before_create  :admin_checks
  after_create   :send_invite_to_admin
  #after_create   :create_team_member, :unless => lambda{|team| team.current_team_id.blank? }
  after_create   :create_team, :if => :team_admin?

  def send_invite_to_admin
     AdminNotificationMailer.welcome_email(self.company, self).deliver! if self.role == Role.super_admin
  end

  rails_admin do
    field :name do
      label 'Admin Name'
    end
    field :email
    field :role_id, :enum do
      enum do
        [[Role.super_admin.name, Role.super_admin.id]] rescue []
      end
    end
    field :company do
      inverse_of :admin
    end
   
  end


  def create_team
    Rails.logger.info "INSIDE TEAM CREATE"
    team = Team.create(name: team_name)
    Rails.logger.debug team.errors.inspect
    team_member = TeamsMembers.create(member_id: self.id, team_id: team.id)   
    Rails.logger.debug team_member.errors.inspect
  end


  def assign_random_password
    random_password = "abrakadabra@12345"
    self.password = self.password_confirmation = random_password
  end

  def update_password_with_confirmation(params)
    Rails.logger.info "--> updating password"
    self.password = params[:password]
    self.password_confirmation = params[:password_confirmation]
    self.valid?
    logger.info self.errors.inspect
    return false if not valid?
    confirm!
    save
  end

  def admin_checks
    if self.role?(Role.super_admin)
      self.skip_confirmation_notification!
    else
      return
    end
  end

  def parametrize
    [self.name, self.id].join("-").gsub(" ", "-")
  end

  def today_status
    Status.where("member_id = ? AND Date(created_at) = ?", self.id, Date.today).first
  end

  ## Role
  #------------------------------------------------------------------------------------------

   def role?(_role)
     self.role == _role
   end

  def super_admin?
    role == Role.super_admin
  end

  def admin?
    role == Role.admin
  end

  def member?
    role == Role.member
  end
  #------------------------------------------------------------------------------------------
  ##

  def create_team_member
    TeamsMembers.create!(member_id: self.id, team_id: current_team_id)
  end

  def add_standup_token
    self.standup_email_token = Devise.friendly_token
  end

  def send_standup_email
    Notification.standup_notify(self).deliver
  end


  def team_admin?   
    (self.teams_members.blank? and self.role == Role.admin) 
  end


  ##
  ## DEVISE OVERRIDES


  def self.find_original_token(token)
    confirmation_token = Devise.token_generator.digest(self, :confirmation_token, token)
    member = self.find_by_confirmation_token(confirmation_token)
    return [member, confirmation_token]
  end

#
#   ABILITIES
#
  # def can?(action, entity)
  #   if super_admin?
  #     return true
  #   elsif member?
  #   end
  # end
end
