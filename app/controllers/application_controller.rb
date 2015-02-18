class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_team


  def current_team    
    @current_team||=current_member.teams.includes(:members).first           # Later on this will moved to dropdown select where a team lead can select the team that we reset to current team
  end


  def after_sign_in_path_for(resource)
    dashboard_path
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :team_name, :role_id]
  end


  def status_params
    params.require(:status).permit(:today_plan, :tomorrow_plan, :yesterday_plan, :oid)
  end

  def allow_email_form_submission
    if Rails.env.development?
      response.headers["X-Frame-Options"] = "http://localhost:1050"
    end
  end

  def require_site_admin
    http_basic_authenticate_with name: "smadmin", password: "secret#123#", except: :index
  end

  def not_found
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.any  { head :not_found }
    end
  end
end
