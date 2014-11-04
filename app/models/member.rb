class Member < ActiveRecord::Base
  
  # Associations
  has_one :role
  has_many :teams_members, class_name: "TeamsMembers"
  has_many :teams, :through => :teams_members, :dependent => :destroy
  
end
