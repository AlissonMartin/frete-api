class AuthMailer < ApplicationMailer

  include AuthenticationHelper

  def email_confirmation(user)
    @name = user.name
    @token = generateToken({confirm_email_user_id: user.id})
    mail to: user.email, subject: "Confirmação de e-mail", template_name: "confirm_email"
  end

end
