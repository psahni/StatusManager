class RegistrationsController < Devise::RegistrationsController

	before_filter :add_role, :only => :create

	def new
		super
	end

	def create
	 super		
	end


#PRIVATE
	
	private

	def add_role
		params[:member].delete(:role_id)
		params[:member].merge!(:role_id => Role.admin.id)
	end

end
