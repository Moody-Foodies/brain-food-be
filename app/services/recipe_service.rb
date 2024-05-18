class RecipeService
  def get_recipes(details)
    require 'pry' ; binding.pry
    response = get_url("recipes?nutrient=#{details[:nutrient].name}&cook_time=#{details[:cook_time]}")
  end

  def get_url(url)
    response = conn.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://recipes-service-be-27616f8124c6.herokuapp.com/")
  end
end