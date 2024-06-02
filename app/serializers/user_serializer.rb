class UserSerializer
  include JSONAPI::Serializer
  :id 
  attribute :name
  attribute :token do |object, params|
    params[:token]
  end

  attribute :moods do |object, params|
    if params[:dashboard]
      params[:dashboard][:moods][:attributes]
    end
  end

  attribute :recipes do |object, params|
    if params[:dashboard]
      params[:dashboard][:recipes][:data]
    end
  end
end