class CustomerSerializer
  include JSONAPI::Serializer
  attributes :id, :firstname, :lastname, :email, :address
end
