class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, brain_food_secret) 
  end

  def decoded_token
    header = request.headers['Authorization']
    if header
        token = header.split(" ")[1]
        begin
            JWT.decode(token, brain_food_secret)
        rescue JWT::DecodeError
            nil
        end
    end
  end

  def brain_food_secret
    "brain_food_secret"
  end
end
