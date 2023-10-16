module AuthenticationHelper

  def generateToken(payload)
    token = JWT.encode payload, ENV["JWT_SECRET_KEY"], "HS256"
  end

  def decodeToken(token)
    begin
      decoded_token = JWT.decode token, ENV["JWT_SECRET_KEY"], true, { algorithm: 'HS256' }
    rescue JWT::DecodeError
      render json: {error: "Token inválido" }, status: :unauthorized
    end
  end
  
  
end