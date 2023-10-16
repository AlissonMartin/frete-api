class UserController < ApplicationController

  def update

    if @user.update(user_params)
      render json: {data: @user}
    else
      render json: {error: "Parametros inválidos"}, status: :bad_request
    end

  end

  def show
    render json: {data: @user.as_json(only: [:id, :name, :email])}
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end