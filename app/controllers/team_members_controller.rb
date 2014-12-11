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


  # PRIVATE

  private

  def member_params
    params.require(:team_member).permit(:name, :email)
  end



end
