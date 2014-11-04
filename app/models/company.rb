# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  domain_name :string(255)
#  email       :string(255)
#  mobile      :string(255)
#  website     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Company < ActiveRecord::Base
  
  # Validations
  validates :name, :presence => true, :uniqueness => true
  
  # Associations
  has_many :teams
  
end
