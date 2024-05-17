class FavoriteRecipesService
  def conn
    Faraday.new(url: "https://7a97657d-b4dd-468a-960b-563f46161622.mock.pstmn.io")
  end

  def create_recipe(recipe_details)
    response = conn.post("/api/v1/recipes/favorites") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = recipe_details.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
