module ApplicationHelper

  def display_flash
    message = ''
    flash.each do |key, value|
      message+= "<div class='alert alert-#{key}'>"
      message+='<a href="#" data-dismiss="alert" class="close">×</a>'
      message+=value
      message+='</div>'
    end
    message.html_safe
  end

end
