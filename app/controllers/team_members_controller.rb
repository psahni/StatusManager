class TeamMembersController < ApplicationController

	#before_filter :allow_super_admin

	def create
    member = Member.new(member_params.merge(:current_team_id =>  current_team.id, role_id: Role.member.id))
    if member.save
      render json: {email: member.email, name: member.name, id: member.id}, status: :created
    else
      render :json => member.errors, status: :unprocessable_entity
    end
	end

#-----------------------------------------------------------------------------------------------------


  def new
		render :partial => "members/create_member"
  end

#-----------------------------------------------------------------------------------------------------

  def getStatus
    _start = params[:start]
    _end = params[:end]
    start_time =  DateTime.strptime(_start, "%s").inspect
    end_time =  DateTime.strptime(_end,"%s").inspect
    statuses = Status.where("created_at > ? AND created_at <  ?", start_time, end_time)
    render :json => statuses.to_json, :status => :ok
  end

  # PRIVATE

  private

  def member_params
    params.require(:team_member).permit(:name, :email)
  end



end
