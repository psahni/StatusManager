class HomeController < ApplicationController
  
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
    @member = Member.where(name: 'Mhaider').first
  end

end