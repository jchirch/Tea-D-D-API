require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it 'validates relationships' do
      should have_many(:subscription)
      should have_many(:tea).through(:subscription)
    end
  end

  describe 'validations' do
    it 'validates attributes' do
      should validate_presence_of(:firstname)
      should validate_presence_of(:lastname)
      should validate_presence_of(:email)
      should validate_presence_of(:address)
    end
  end
end
