class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :jti
end
