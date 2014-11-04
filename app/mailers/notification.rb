class Notification < ActionMailer::Base
  default from: "noreply@nostatus.com"

  def standup_notify()
    mail(to: "prashant.sahni5@gmail.com", subject: 'Standup Notification')
  end
end
