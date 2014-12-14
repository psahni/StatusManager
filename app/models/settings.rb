# == Schema Information
#
# Table name: settings
#
#  id            :integer          not null, primary key
#  alarm_minutes :string(255)
#  alarm_hours   :string(255)
#  team_id       :integer
#  timezone      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Settings < ActiveRecord::Base

  belongs_to :team


  validates :timezone, presence: :true
  validates :alarm_minutes, presence: :true
  validates :alarm_minutes, presence: :true

  def get_time(zone)
    ActiveSupport::TimeZone.find_tzinfo(zone).now
  end

end
