class Notification < ActionMailer::Base
  default from: "noreply@nostatus.com"

  def standup_notify(member)
    @url = submit_email_url(member.standup_email_token)
    @member = member
    mail(to: member.email, subject: 'Standup Notification')
  end
end
