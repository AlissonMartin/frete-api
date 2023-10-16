class ApplicationController < ActionController::API
  before_action :authenticate

  include AuthenticationHelper

  def authenticate
    token = request.headers["Authorization"].split(" ").last if request.headers["Authorization"]
    decoded_token = decodeToken(token)
    @user = User.find(decoded_token[0]["user_id"])
  end
  
end
