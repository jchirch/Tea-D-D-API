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
      should validate_presence_of(:activestatus)
      should validate_presence_of(:frequency)
    end
  end
end
