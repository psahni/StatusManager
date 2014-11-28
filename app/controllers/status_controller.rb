class StatusController < ApplicationController


  before_action :authenticate_member!

  def create
    status = Status.new(status_params)
    if status.save
      flash[:success] = "Status has been created successfully. Your team admin will be notified shortly."
      render json: {oid: status.oid, next_uri: status_show_path(status.oid)}, status: :created, location: status
    else
      render json: status.errors, status: :unprocessable_entity
    end
  end

  def edit
    @status = Status.find_by_oid(params[:oid]) or not_found
  end

  def show
    @status = Status.find_by_oid(params[:oid]) or not_found
    respond_to do |format|
      format.html{
      }
    end
  end

#-----------------------------------------------------------------------------------------------------



  private

  def status_params
    params.require(:status).permit(:today_plan, :tomorrow_plan, :yesterday_plan)
  end
end



