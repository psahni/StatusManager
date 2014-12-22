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

  after_create   :schedule_job
  before_update  :reschedule_job

  def get_time(zone)
    ActiveSupport::TimeZone.find_tzinfo(zone).now
  end

  def trigger_standup_notify
     Rails.logger.info "=========================="
     Rails.logger.info self.inspect
     self.team.members_except_lead.each do |m|
      m.send_standup_email
     end
     Rails.logger.info "=========================="
  end


  def schedule_job
    @id = self.id
    Rails.logger.info "--> Scheduling job for #{self.team.name}"
    self.job_id = schedular.cron "#{ self.alarm_minutes } #{ self.alarm_hours } * * 1-5 Asia/Calcutta" do     
     setting = Settings.find(@id)
     setting.trigger_standup_notify()   
    end
    Rails.logger.info "--> Job scheduled. Job Id = #{ job_id }"
    save
  end

  def reschedule_job    
    if schedular.down?
      Rails.logger.info "--> Schedular is down"
      Rails.logger.info schedular.down?      
      return
    end
    job = schedular.job(self.job_id)
    if job 
      Rails.logger.info "--> Unscheduling JOB ID for setting id #{self.id}"
      Rails.logger.info job_id.inspect
      job.unschedule
    end
    Rails.logger.info "--> Updating JOB for setting id #{ self.id }"
    @id = self.id
    self.job_id = schedular.cron "#{ self.alarm_minutes } #{ self.alarm_hours } * * 1-5 Asia/Calcutta" do     
     setting = Settings.find(@id)
     setting.trigger_standup_notify()     
    end
  end


end
