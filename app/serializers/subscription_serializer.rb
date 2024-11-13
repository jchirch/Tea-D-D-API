class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :price, :activestatus, :frequency, :tea_details, :customer_details

  belongs_to :customer, serializer: CustomerSerializer
  belongs_to :tea, serializer: TeaSerializer

  attribute :tea_details do |object|
    {
      title: object.tea.title,
      description: object.tea.description,
      temperature: object.tea.temperature,
      brewtime: object.tea.brewtime
    }
  end

  attribute :customer_details do |object|
    {
      firstname: object.customer.firstname,
      lastname: object.customer.lastname,
      email: object.customer.email,
      address: object.customer.address
    }
  end
end
