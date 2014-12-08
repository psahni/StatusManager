class MembersController < ApplicationController

	#before_filter :allow_super_admin

	def create

	end

	def new
		render :partial => "members/create_member"
	end



end
