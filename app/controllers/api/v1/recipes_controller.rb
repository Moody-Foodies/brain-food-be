class Api::V1::RecipesController < ApplicationController
  before_action :decode_token

  def index
    n = Nutrient.find_by(id: params[:mood])
    details = {:nutrient=> n, :cook_time=>params[:time_available]}
    recipes = RecipeFacade.new(details).get_recipe_data
    mood = { "user_id": params[:user_id].to_i, "mood": params[:mood].to_i }
    mood = MoodFacade.new(mood).create_user_mood

    render json: RecipeSerializer.new(recipes).serializable_hash
  end
end
