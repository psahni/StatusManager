class Member < ActiveRecord::Base
  
  # Associations
  has_many :teams_members, class_name: "TeamsMembers"
  has_many :teams, :through => :teams_members, :dependent => :destroy
  belongs_to :company
  belongs_to :role

  validates :email, presence: true

end
