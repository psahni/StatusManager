class Team < ActiveRecord::Base
  
  # Validations
  validates :name, :uniqueness => true, :presence => true
  
  # Associations
  has_many :members, :through => :teams_members, :dependent => :destroy
  
end
