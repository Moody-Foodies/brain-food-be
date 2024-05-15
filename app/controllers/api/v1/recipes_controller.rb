class Api::V1::RecipesController < ApplicationController
  def index
    n = Nutrient.find_by(id: params[:mood])
    details = {:nutrient=> n, :cook_time=>params[:time_available]}
    recipes = RecipeFacade.new(details).get_recipe_data
    

    render json: RecipeSerializer.new(recipes).serializable_hash
  end
end


    # render json: RecipeSerializer.serialize(recipes)
