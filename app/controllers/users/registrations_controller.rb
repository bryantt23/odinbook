class Users::RegistrationsController < Devise::RegistrationsController
  # POST /users
  def create
    super do |user|
      UserMailer.welcome_email(user).deliver_now
    end
  end
end
