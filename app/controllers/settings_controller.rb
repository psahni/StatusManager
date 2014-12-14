class SettingsController < ApplicationController

	def index
		@setting = current_team.setting || current_team.build_setting
	end

	def create
	end

end
