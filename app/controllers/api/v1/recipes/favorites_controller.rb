class Api::V1::Recipes::FavoritesController < ApplicationController
  def index
    user_id = params[:user_id]
    favorite_recipes = FavoritesFacade.get_favorite_recipes(user_id)
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
    result = FavoritesFacade.delete_favorite_recipe(params[:user_id], params[:recipe_id])
    render json: result.body, status: result.status
  end

  private

  def recipe_details
    {
      id: params[:id],
      type: params[:type],
      user_id: params[:user_id],
      attributes: params[:attributes]
    }
  end
end
