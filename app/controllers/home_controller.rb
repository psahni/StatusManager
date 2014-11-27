class HomeController < ApplicationController

  layout 'root', :only => :index

  before_filter :authenticate_member!

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
    # @activities =  PublicActivity::Activity.where(owner_type: 'Member')
    role = current_member.role
    case role
        when Role.super_admin
        when Role.admin
         @partial_name = 'admin_team'
        when Role.member
          @partial_name = 'member_team'
        else
         flash[:alert] = "No role has been assigned to you."
    end
  end

end