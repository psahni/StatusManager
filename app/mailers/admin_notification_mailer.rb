class AdminNotificationMailer < ActionMailer::Base
  default from: "metesttatusmanager@gmail.com"

  def welcome_email(company, admin)
    @company = company
    @admin = admin
    mail(to: "nishutosh.sharma@trantorinc.com", subject: "You have been invited to the Status Manager!")
  end

end
