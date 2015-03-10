class HomeController < ApplicationController

  layout 'root', :only => :index

  before_filter :authenticate_member!, :except => [:inline_email_submit, :inline_email, :index, :job_test]
  skip_before_filter :verify_authenticity_token, :only => [:inline_email_submit]
  before_filter :allow_email_form_submission, :only => [:inline_email_submit]

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
    @activities =  current_team.activity_history
    role = current_member.role
    Rails.logger.info role.inspect
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
    token = params[:token]
    @member = Member.where(standup_email_token: token).first
    if @member
      @status = Status.new(status_params.merge(member_id: @member.id))
      unless @status.valid?
        @url = submit_email_url(token)
        render :template => 'status/_email_form_template.html.erb'
      else
        @status.save  
        render :text => "<h1>Thank you for submission</h1>"
      end
    else
      render :text => "<h1>Invalid Request</h1>"
    end
  end

end