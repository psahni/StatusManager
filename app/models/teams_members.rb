# == Schema Information
#
# Table name: teams_members
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  team_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class TeamsMembers < ActiveRecord::Base
  
  belongs_to :member
  belongs_to :team
  
end
