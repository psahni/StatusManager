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

  self.include_root_in_json = false
  self.primary_key = 'oid'

  include PublicActivity::Model
  include OidGenerator
  tracked owner: :member

  belongs_to :member


  # VALIDATIONS
  validates :today_plan, :tomorrow_plan, :member_id , :presence => true



  def self.to_csv(member, duration)
    statuses = member.statuses.where("created_at > ?", duration.days.ago)
    FileUtils.mkdir("csvs") unless File.exists?("csvs")
    statuses.each do |status|
      File.open("#{Rails.root}/csvs/#{ member.parametrize }.csv", "w") do |file|
        file.write("#{status.created_at.strftime("%v")}  #{status.today_plan}")
      end
    end
  end


  def self.created_for_today?(member)
    Status.where("member_id = ? AND Date(created_at) = ?", member.id, Date.today).first
  end


  def as_json(options = {})
    super(:only => [:today_plan, :yesterday_plan, :tomorrow_plan, :oid, :created_at])
  end

end
