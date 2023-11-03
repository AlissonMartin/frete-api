class AuthenticationController < ApplicationController

  skip_before_action :authenticate

  include AuthenticationHelper

  def signin
    user = User.find_by(email: params[:email])

    if user.present?
      return render json: {error: "Confirme o e-mail"}, status: :bad_request unless user.email_confirm.present?
      return render json: {error: "Email ou senha inválidos"}, status: :bad_request unless BCrypt::Password.new(user.password_digest) == params[:password]
      token = generateToken({user_id: user.id})
      render json: {user: UserSerializer.new(user),token: token}
    else
      render json: {error: "Email ou senha inválidos"}, status: :bad_request
    end
  end

  def signup
    user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if user.save
      AuthMailer.email_confirmation(user).deliver_now!
      render json: {message: "Confirme o e-mail"}, status: :created
    else
      render json: {error: "Erro no cadastro"}, status: :bad_request
    end
  end

  def confirm_email
    token = params[:token]
    decoded_token = decodeToken(token)
    user = User.find(decoded_token[0]["confirm_email_user_id"])
    if user.present? && user.confirm_email.blank?
      user.update(confirm_email: true)
      token = generateToken({user_id: user.id})
      render json: {token: token}
    else
      render json: {error: "Falha ao confirmar e-mail"}, status: :bad_request
    end
  end

  private

  def signin_params
    params.require(:user).permit(:name, :email, :password)
  end


end
