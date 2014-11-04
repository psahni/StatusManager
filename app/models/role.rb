# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  active      :boolean          default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Role < ActiveRecord::Base
  
  # Validations
  validates :name, :uniqueness => true, :presence => true
  
  # Associations
  belongs_to :member
  
end
