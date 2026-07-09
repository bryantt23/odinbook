class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def welcome_email(user)
    @email=user.email
    mail(to: @email, subject: "Thank you for signing up")
  end
end
