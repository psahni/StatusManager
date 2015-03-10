class RegistrationsController < Devise::RegistrationsController

	before_filter :add_role, :only => :create

	def new
		super
	end

	def create
	   build_resource(sign_up_params)
	   resource.save
	   yield resource if block_given?
	   if resource.persisted?
	       if resource.active_for_authentication?
	        set_flash_message :notice, :signed_up if is_flashing_format?
	        sign_up(resource_name, resource)
	        respond_with resource, location: after_sign_up_path_for(resource)
	      else
	        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
	        expire_data_after_sign_in!
	        respond_with resource, location: after_inactive_sign_up_path_for(resource)
	      end
      else
	      clean_up_passwords resource
	      set_minimum_password_length
	      respond_with resource
      end
	end


#PRIVATE
	
	private

	def add_role
		params[:member].delete(:role_id)
		params[:member].merge!(:role_id => Role.admin.id)
	end

   def sign_up_params
     devise_parameter_sanitizer.sanitize(:sign_up)
   end

   def after_sign_up_path_for(resource)
     signup_get_path
   end
   

   def after_inactive_sign_up_path_for(resource)
    signup_get_path
  end
  
  # Sets minimum password length to show to user
  def set_minimum_password_length
    if devise_mapping.validatable?
      @minimum_password_length = resource_class.password_length.min
    end
  end
  
  
end
