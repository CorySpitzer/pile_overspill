class UserMailer < ApplicationMailer
  #the email address the message will 'come from'
  default from: "whateveremail@email.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @greeting = "Hi"
    @user = user

    mail to: user.email, subject: "Sign-Up Confirmation"
  end
end
