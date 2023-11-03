class Owner::CompanyController < Owner::OwnerController
  def list
    users = User.where(company: @user.company)
    render json: users
  end

end
