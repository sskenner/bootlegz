class AppMailer < ActionMailer::Base
  def send_welcome_email(user)
    @user = user
    mail to: user.email, from: "info@bootlegz.com", subject: "welcome to bootlegz!"
  end

  def send_forgot_password(user)
    @user = user
    mail to: user.email, from: "info@bootlegz.com", subject: "please reset your password"
  end

  def send_invitation_email(invitation)
    @invitation = invitation
    mail to: invitation.recipient_email, from: "info@bootlegz.com", subject: "invitation to join bootlegz"
  end
end
