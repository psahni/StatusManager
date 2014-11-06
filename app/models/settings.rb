class Settings < ActiveRecord::Base

  belongs_to :team




  def get_time(zone)
    ActiveSupport::TimeZone.find_tzinfo(zone).now
  end

end
