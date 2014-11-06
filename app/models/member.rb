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
#

class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutableand :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Validations
  # validate :name, :presence => true, :uniqueness => true
  validates :email, presence: true

  # Associations
  has_many :teams_members, class_name: "TeamsMembers"
  has_many :teams, :through => :teams_members, :dependent => :destroy
  belongs_to :company
  belongs_to :role

  after_create :send_invite_to_admin

  def send_invite_to_admin
     AdminNotificationMailer.welcome_email(self.company, self).deliver! if self.role == Role.super_admin
  end

end
