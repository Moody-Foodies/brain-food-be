class FavoritesService
  def self.conn 
    Faraday.new(url: "https://favorite-recipes-service-7d6cb7e82492.herokuapp.com")
  end

  def self.delete_url(url, body)
    conn.delete(url) do |r|
      r.body = body
      r.headers = {"Content_Type" => "application/json"}
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.delete_favorite_recipe(user_id, recipe_id)
    delete_url("/api/v1/favorite_recipes", {user_id: user_id, id: recipe_id})
  end

  def self.get_favorite_recipes(user_id)
    url = user_id ? "/api/v1/favorite_recipes?user_id=#{user_id}" : "/api/v1/favorite_recipes"
    get_url(url)
  end
end
