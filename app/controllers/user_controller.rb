class UserController < ApplicationController

  def update

    if @user.update(user_params)
      render json: @user
    else
      render json: {error: "Parametros inválidos"}, status: :bad_request
    end

  end

  def show
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
