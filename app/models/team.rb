# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  code        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Team < ActiveRecord::Base
  
  # Validations
  validates :name, :uniqueness => true, :presence => true
  
  # Associations
  has_many :teams_members, class_name: "TeamsMembers"
  has_many :members, :through => :teams_members, :dependent => :destroy
  belongs_to :company



  def self.find_or_create!(team)
    Team.create!(name: team_name)
  end
end
