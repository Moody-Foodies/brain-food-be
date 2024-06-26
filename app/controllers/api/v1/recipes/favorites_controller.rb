class Api::V1::Recipes::FavoritesController < ApplicationController
  before_action :decode_token

  def index
    user_id = @current_user.id
    favorite_recipes = FavoritesFacade.new.get_favorite_recipes(user_id)
    if favorite_recipes[:errors]
      render json: favorite_recipes, status: :bad_request
    elsif
      render json: FavoritesSerializer.new(favorite_recipes[:data], user_id: user_id).serializable_hash
    end
  end

  def create
    recipe_info = recipe_details
    FavoriteRecipesFacade.new(recipe_info).create_favorite_recipe
    render json: { message: "Favorite recipe created successfully" }, status: :created
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def destroy
    result = FavoritesFacade.new.delete_favorite_recipe(@current_user.id, params[:recipe_id])
    render json: result.body, status: result.status
  end

  private

  def recipe_details
    {
      id: params[:id],
      type: params[:type],
      user_id: @current_user.id,
      attributes: params[:attributes]
    }
  end
end
