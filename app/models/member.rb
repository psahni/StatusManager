class Member < ActiveRecord::Base
  
  # Associations
  has_one :role
  has_many :teams, :through => :teams_members,
                  :dependent => :destroy


  def get_time(zone)
    ActiveSupport::TimeZone.find_tzinfo(zone).now
  end

end
