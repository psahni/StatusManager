require 'rufus-scheduler'

puts "schedular is loading..."

module Rufus
	class Scheduler
		cattr_accessor :sm_schedular
	end
end

def schedular
	return Rufus::Scheduler.sm_schedular if Rufus::Scheduler.sm_schedular
	Rails.logger.info "--> INITIALIZING SCHEDULAR"
	Rufus::Scheduler.sm_schedular = Rufus::Scheduler.new(:lockfile => "mylock.lock")
	Rails.logger.info "--> SCHEDULAR INITIALIZED"
	Rufus::Scheduler.sm_schedular
end
