class Member < ActiveRecord::Base
  
  # Associations
  has_one :role
  has_many :teams, :throught => :teams_members, :dependent => destroy
  
end
