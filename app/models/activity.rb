# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  active      :boolean          default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Activity < ActiveRecord::Base
  
  validates :name, :uniqueness => true, :presence => true
  
end
