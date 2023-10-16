class AuthenticationController < ApplicationController

  skip_before_action :authenticate

  include AuthenticationHelper

  def signin 
    user = User.find_by(email: params[:email])

    if user.present? 
      return render json: {error: "Email ou senha inválidos"}, status: :bad_request unless BCrypt::Password.new(user.password_digest) == params[:password]
      token = generateToken({user_id: user.id})
      render json: {token: token}
    else
      render json: {error: "Email ou senha inválidos"}, status: :bad_request
    end
  end

  def signup
    user = User.new(name: params[:name], email: params[:email], password: params[:password])

    if user.save
      token = generateToken(user.id)
      render json: {token: token}, status: :created
    else
      render json: {error: "Email já cadastrado"}, status: :bad_request
    end
  end

  private 

  def signin_params
    params.require(:user).permit(:name, :email, :password)
  end
  

end
