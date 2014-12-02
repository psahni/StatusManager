class StatusController < ApplicationController


  before_action :authenticate_member!

  respond_to :json, :html
#-----------------------------------------------------------------------------------------------------

  def create
    status = Status.new(status_params)
    status.member = current_user
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
    #debugger
    if @status.update_attributes!(status_params)
      render json: { oid: @status.oid, next_uri: status_show_path(@status.oid) }
    else
      render json: @status, status: :unprocessable_entity
    end
    endRoot12345


#-----------------------------------------------------------------------------------------------------

  def show
    @status = Status.find_by_oid(params[:oid]) or not_found
  end

#-----------------------------------------------------------------------------------------------------



  private


end



