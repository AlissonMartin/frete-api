module Owner
  class OwnerController <  ApplicationController
    before_action :check_owner

    def check_owner
      render json: {error: "Você não tem permissão."}, status: :unauthorized unless @user.is_owner?
    end

  end
end
