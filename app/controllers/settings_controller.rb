class SettingsController < ApplicationController

	def index
		@setting = current_team.setting || current_team.build_setting	
		Rails.logger.info schedular.cron_jobs	
	end

#----------------------------------------------------------------------------------------------------------

	def create
	 @setting = current_team.build_setting(setting_params)			
	 if @setting.save
	 	redirect_to settings_path, flash: {notice: 'Settings has been saved successfully'}
	 else
	 	render action: :index
	 end
	end

#----------------------------------------------------------------------------------------------------------

	def update
		@setting = current_team.setting
		if @setting.update_attributes(setting_params)
			redirect_to settings_path, flash: {notice: 'Settings has been updated successfully'}	
		else
			render action: :index
		end
	end


#----------------------------------------------------------------------------------------------------------

	private


	def setting_params
		params[:alarm] = params[:date]
		params.require(:alarm).permit(:alarm_hours, :alarm_minutes, :timezone)
	end


end
