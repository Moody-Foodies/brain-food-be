class Api::V1::UsersController < ApplicationController
        def create
          user = User.new(user_params)
          if user.save
            render json: { data: {user_id: user.id,name: user.name} }, status: :created
          else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def update
          user = User.find(params[:id])
          if user.update(user_params)
            render json: {user_id: user.id,name: user.name}, status: :ok
          else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def destroy
          user = User.find(params[:id])
          user.destroy
          render json: { message: 'User deleted successfully' }, status: :ok
        end
  
        private
  
        def user_params
          params.permit(:name, :email, :password)
        end
end

