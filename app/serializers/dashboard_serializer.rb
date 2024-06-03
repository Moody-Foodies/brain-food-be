class DashboardSerializer
  include JSONAPI::Serializer
  :id 
  set_type :user
  attribute :name

  attribute :moods do |object, params|
    params[:dashboard][:moods][:data][:attributes]
  end

  attribute :recipes do |object, params|
      params[:dashboard][:recipes][:data]
  end
end