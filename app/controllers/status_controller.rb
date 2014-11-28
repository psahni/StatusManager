class StatusController < ApplicationController


  before_action :authenticate_member!

  def create
    status = Status.new(status_params)
    if status.save
      render json: status, status: :created, location: status
    else
      render json: status.errors, status: :unprocessable_entity
    end
  end



#-----------------------------------------------------------------------------------------------------



  private

  def status_params
    params.require(:status).permit(:today_plan, :tomorrow_plan)
  end
end



