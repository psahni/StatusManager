class Notification < ActionMailer::Base
  default from: "noreply@nostatus.com"

  def standup_notify()
    @url = submit_email_url('tfgh4567wsed')
    mail(to: "prashant.sahni5@gmail.com", subject: 'Standup Notification')
  end
end
