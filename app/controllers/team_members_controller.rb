class TeamMembersController < ApplicationController

	#before_filter :allow_super_admin

	def create
    member = Member.new(member_params)
    if member.save
    else
      render :json => member.errors, status: :unprocessable_entity
    end
	end

	def new
		render :partial => "members/create_member"
  end


  def member_params
    params.require(:team_member).permit(:name, :email)
  end



end
