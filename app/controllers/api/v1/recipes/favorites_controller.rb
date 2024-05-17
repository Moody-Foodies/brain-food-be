class Api::V1::Recipes::FavoritesController < ApplicationController
  def destroy
    result = FavoritesFacade.delete_favorite_recipe(params[:user_id], params[:recipe_id])
    render json: result.body, status: result.status
  end
end