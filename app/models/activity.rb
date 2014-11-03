class Activity < ActiveRecord::Base
  
  validates :name, :uniqueness => true, :presence => true
  
end
