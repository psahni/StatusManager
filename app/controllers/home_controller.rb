class HomeController < ApplicationController

  layout 'root', :only => :index

  before_filter :authenticate_member!, :except => [:inline_email_submit, :inline_email, :index]
  skip_before_filter :verify_authenticity_token, :only => [:inline_email_submit]


  def index    
  end


  def time
  end
  
  def export_xls
    @statuses = Status.all
    respond_to do |format|
      format.html
      format.xls { 
        send_data(@statuses.to_xls)
        return 
      }
    end
  end



  def dashboard
    # @member = Member.where(name: 'Nishutosh Sharma').first
    # @activities =  PublicActivity::Activity.where(owner_type: 'Member')
    role = current_member.role
    case role
        when Role.admin, Role.super_admin
         @partial_name = 'admin_team'
        when Role.member
          @partial_name = 'member_team'
        else
         flash[:alert] = "No role has been assigned to you."
    end
  end


  def inline_email
     Notification.standup_notify.deliver
     render nothing: true
  end

  def inline_email_submit
    token = 'tfgh4567wsed'
    if params[:token] == token
      @status = Status.new(status_params)
      if not @status.valid?
        @url = submit_email_url(token)
        render :template => 'status/_email_form_template.html.erb'
      else
        @status.save
        render :text => "<h1>Thank you for submission</h1>"
      end
    else
      render :text => "<h1>Invalid Token</h1>"
    end
  end
end