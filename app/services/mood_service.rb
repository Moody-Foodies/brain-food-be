class MoodService
  def conn
    conn = Faraday.new(url: "http://localhost:5000/api/v1") do |faraday|
      faraday.headers['Accept'] = 'application/json'
      faraday.request :json
    end
  end

  def create_user_mood(mood_details)
    # we don't actually have a response body so I'm not saving the response in a variable
    conn.post("/api/v1/moods", mood_details)
  end
end