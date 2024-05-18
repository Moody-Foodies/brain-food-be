class FavoriteRecipesService
  def conn
    Faraday.new(url: "https://favorite-recipes-service-7d6cb7e82492.herokuapp.com/api/v1/favorite_recipes")
  end

  def create_recipe(recipe_details)
    response = conn.post("/api/v1/recipes/favorites") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = recipe_details.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
