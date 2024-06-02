class Api::V1::UsersController < ApplicationController
  before_action :decode_token, except: [:create]
  before_action :find_user, except: [:create]

  def create
    user = User.new(user_params)
    if user.save
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: UserSerializer.new(user, params: { token: token }), status: :created
    else
      render json: ErrorSerializer.new(ErrorMessage.new(user.errors.full_messages)).serialize_json, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user), status: :ok
    else
      render json: ErrorSerializer.new(ErrorMessage.new(@user.errors.full_messages)).serialize_json, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render :no_content, status: :no_content
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end

