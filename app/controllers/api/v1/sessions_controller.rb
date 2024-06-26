class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: login_params[:email])
    if user && user.authenticate(login_params[:password])
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: UserSerializer.new(user, params: { token: token } ), status: :ok
    else
      message = "Invalid email or password"
      render json: ErrorSerializer.new(ErrorMessage.new(message)).serialize_json, status: :unprocessable_entity
    end
  end

  def destroy
      render json: { data: { message: 'Logged out successfully' } }, status: :ok
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
