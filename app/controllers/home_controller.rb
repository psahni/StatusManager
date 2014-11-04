class HomeController < ApplicationController
  
  def index
  end


  skip_before_filter :verify_authenticity_token, :only => [:inline_email_submit]

  def inline_email
     Notification.standup_notify.deliver
     render nothing: true
  end

  def inline_email_submit
    token = 'tfgh4567wsed'
    if params[:token] == token
      render :text => "<h1>Thank you for submission</h1>"
    else
      render :text => "<h1>Invalid Token</h1>"
    end
  end
end