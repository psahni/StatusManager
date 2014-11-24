# == Schema Information
#
# Table name: statuses
#
#  id             :integer          not null, primary key
#  member_id      :integer
#  yesterday_plan :text
#  today_plan     :text
#  tomorrow_plan  :text
#  created_at     :datetime
#  updated_at     :datetime
#

require 'csv'

class Status < ActiveRecord::Base

  include PublicActivity::Model
  tracked owner: :member

  belongs_to :member






  def self.import_csv
    statues = CSV.read(Rails.root.to_s + '/db/data/status.csv', :headers => true, :skip_blanks => true)
    return nil if statues.empty?
    statues.each do |status|
      # Get Member
      member = Member.find_by_name(status['Member Name'])
      
      if member
        Status.create(
          member_id: member.id,
          yesterday_plan: status['Yesterday'],
          today_plan: status['Today'],
          tomorrow_plan: status['Tomorrow']
        )
      end
    end

  end


  def self.created_for_today?(member)
    Status.where("member_id = ? AND Date(created_at) = ?", member.id, Date.today).first
  end

end
