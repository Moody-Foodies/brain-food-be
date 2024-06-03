class UserSerializer
  include JSONAPI::Serializer
  :id 
  attribute :name
  attribute :token do |object, params|
    params[:token]
  end
end