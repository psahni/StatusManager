class Company < ActiveRecord::Base
  
  # Validations
  validates :name, :presence => true, :uniqueness => true
  
  # Associations
  has_many :teams
  
end
