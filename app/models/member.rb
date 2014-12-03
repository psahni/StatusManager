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
#  birthday       :date
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
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  attr_accessor :password_confirmation

  # Validations
  validate :name, :presence => true, :uniqueness => true
  validates :email, presence: true
  validates_confirmation_of :password

  # Associations
  has_many :teams_members, class_name: "TeamsMembers"
  has_many :teams, :through => :teams_members, :dependent => :destroy
  belongs_to :company
  belongs_to :role


  before_validation :assign_random_password, :if => lambda{|obj| obj.role?(Role.super_admin) }
  before_create :admin_checks
  after_create :send_invite_to_admin


  def send_invite_to_admin
     AdminNotificationMailer.welcome_email(self.company, self).deliver! if self.role == Role.super_admin
  end

  rails_admin do
    field :name
    field :email
    field :role, :enum do
      enum do
        [[Role.super_admin.name, Role.super_admin.id]] rescue []
      end
    end
  end



  def assign_random_password
    random_password = "abrakadabra@12345"
    self.password = self.password_confirmation = random_password
  end

  def role?(_role)
    self.role == _role
  end

  def admin_checks
    if self.role?(Role.super_admin)
      self.skip_confirmation_notification!
    else
      return
    end
  end


  def today_status
    Status.where("member_id = ? AND Date(created_at) = ?", self.id, Date.today).first
  end
end
