class Team < ActiveRecord::Base
  
  # Validations
  validates :name, :uniqueness => true, :presence => true
  
  # Associations
  has_many :teams_members, class_name: "TeamsMembers"
  has_many :members, :through => :teams_members, :dependent => :destroy
  belongs_to :company
  
end
