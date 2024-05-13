class RecipesService
  def get_recipes(body)
    response = post_url(body)
  end

  def post_url(body)
    response = conn.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = body.to_json
    end
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://7a97657d-b4dd-468a-960b-563f46161622.mock.pstmn.io/api/v1/recipes")
  end
end