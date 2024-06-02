class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
    end
  end

  def destroy
      render json: { data: { message: 'Logged out successfully' } }, status: :ok
  end
end
