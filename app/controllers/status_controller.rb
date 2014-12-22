class StatusController < ApplicationController


  before_action :authenticate_member!
  before_filter :allow_email_form_submit, :only => [:create, :update]
  respond_to :json, :html
#-----------------------------------------------------------------------------------------------------

  def create
    logger.info "user is #{status_user}"
    status = Status.new(status_params.merge(:member_id => status_user.id))
    if status.save
      flash[:success] = "Status has been created successfully. Your team admin will be notified shortly."
      render json: {oid: status.oid, next_uri: status_show_path(status.oid)}, status: :created, location: status
    else
      render json: status.errors, status: :unprocessable_entity
    end
  end

#-----------------------------------------------------------------------------------------------------


  def edit
    @status = Status.find_by_oid(params[:oid]) or not_found
  end

#-----------------------------------------------------------------------------------------------------

  def update
    @status = Status.find_by_oid(params[:oid]) or not_found
      if @status.update_attributes!(status_params)
        render json: { oid: @status.oid, next_uri: status_show_path(@status.oid) }
      else
        render json: @status, status: :unprocessable_entity
      end
    end


#-----------------------------------------------------------------------------------------------------

  def show
    @status = Status.find_by_oid(params[:oid]) or not_found
  end

#-----------------------------------------------------------------------------------------------------



  private

  def status_user
    if logged_in?
      return current_member
    else
        member = Member.where(standup_email_token: params[:token]).first
        return render :text => "<h1>Invalid Request.</h1>"   unless member
        return member
    end
  end
end



