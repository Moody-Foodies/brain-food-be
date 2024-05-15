class RecipeService
  def get_recipes(details)
    response = get_url("recipes?nutrient=#{details[:nutrient].name}&cook_time=#{details[:cook_time]}")
  end

  def get_url(url)
    response = conn.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://7a97657d-b4dd-468a-960b-563f46161622.mock.pstmn.io")
  end
end