class HomeController < ApplicationController

  layout 'root', :only => :index

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
    @member = Member.where(name: 'Nishutosh Sharma').first
    @activities =  PublicActivity::Activity.where(owner_type: 'Member')
  end

end