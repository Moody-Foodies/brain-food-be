class MoodService
  def conn
    conn = Faraday.new(url: "https://user-moods-73d107f0a7fc.herokuapp.com") do |faraday|
      faraday.headers['Accept'] = 'application/json'
      faraday.request :json
    end
  end

  def create_user_mood(mood_details)
    response = conn.post("/api/moods", mood_details)

    JSON.parse(response.body, symbolize_names: true)
  end

  def get_moods(user_id)
    response = conn.get("/api/moods?user_id=#{user_id}")

    JSON.parse(response.body, symbolize_names: true)
  end
end