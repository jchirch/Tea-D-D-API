class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :price, :activestatus, :frequency

  belongs_to :customer
  belongs_to :tea
end
