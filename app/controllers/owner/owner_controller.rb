class AdminController < ApplicationController
  before_action :check_admin

  def check_admin
    render json: {error: "Você não tem permissão."}, status: :unauthorized
  end

end
