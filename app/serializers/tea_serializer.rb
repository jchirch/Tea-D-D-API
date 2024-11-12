class TeaSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :description, :temperature, :brewtime
end
