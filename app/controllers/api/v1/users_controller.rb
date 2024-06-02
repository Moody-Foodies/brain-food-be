class Api::V1::UsersController < ApplicationController
        def create
          user = User.new(user_params)
          if user.save
            render json: UserSerializer.new(user), status: :created
          else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def update
          user = User.find(params[:id])
          if user.update(user_params)
            render json: UserSerializer.new(user), status: :ok
          else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def destroy
          user = User.find(params[:id])
          user.destroy
          render :no_content, status: :no_content
        end
  
        private
  
        def user_params
          params.permit(:name, :email, :password)
        end
end

