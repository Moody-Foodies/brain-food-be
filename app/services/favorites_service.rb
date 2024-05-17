class FavoritesService
  def self.conn 
    Faraday.new(url: "https://recipes-service-be-27616f8124c6.herokuapp.com")
  end

  def self.delete_url(url, body)
    conn.delete(url) do |r|
      r.body = body
      r.headers = {"Content_Type" => "application/json"}
    end
  end

  def self.delete_favorite_recipe(user_id, recipe_id)
    delete_url("/api/v1/favorite_recipes", {user_id: user_id, id: recipe_id})
  end
end
