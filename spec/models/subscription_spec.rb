require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it 'validates relationships' do
      should belong_to(:customer)
      should belong_to(:tea)
    end
  end

  describe 'validations' do
    it 'validates attributes' do
      should validate_presence_of(:title)
      should validate_presence_of(:price)
      should validate_presence_of(:frequency)
    end

    it 'validates numericality of price' do
      test_subscription = Subscription.new(title: "example", price: "potato", frequency: "example", activestatus: false)
      should validate_numericality_of(:price).with_message("Price must be a number.")
    end
  end
end
