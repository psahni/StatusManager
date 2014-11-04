# == Schema Information
#
# Table name: members
#
#  id             :integer          not null, primary key
#  role_id        :integer
#  manager_id     :integer
#  name           :string(255)      not null
#  email          :string(255)      not null
#  gender         :string(10)
#  birthday       :date
#  designation    :string(50)
#  avtar          :string(255)
#  active         :boolean          default(FALSE)
#  last_logged_in :datetime
#  soft_delete    :boolean          default(FALSE)
#  created_at     :datetime
#  updated_at     :datetime
#

class Member < ActiveRecord::Base
  
  # Validations
  validate :name, :presence => true, :uniqueness => true
  
  # Associations
  has_one :role
  has_many :teams, :through => :teams_members, :dependent => :destroy
  
end
