class ApplicationController < ActionController::API

  private

  def encode_token(payload)
    JWT.encode(payload, brain_food_secret) 
  end

  def decode_token
    header = request.headers['Authorization']
    if header
      header = header.split(" ").last 
      begin
        @decoded = JWT.decode(header, brain_food_secret)
        @current_user = User.find(@decoded.first["user_id"])
      rescue ActiveRecord::RecordNotFound => error
        render json: ErrorSerializer.new(ErrorMessage.new(error.message)).serialize_json, status: :bad_request
      rescue JWT::DecodeError => error
        render json: ErrorSerializer.new(ErrorMessage.new(error.message)).serialize_json, status: :bad_request
      end
    else
      render json: ErrorSerializer.new(ErrorMessage.new("Authorization header missing")).serialize_json, status: :bad_request
    end
  end

  def brain_food_secret
    "brain_food_secret"
  end
end
