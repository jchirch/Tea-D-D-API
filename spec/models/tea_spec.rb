require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe 'relationships' do
    it 'validates relationships' do
      should have_many(:subscription)
    end
  end

  describe 'validations' do
    it 'validates attributes' do
      should validate_presence_of(:title)
      should validate_presence_of(:description)
      should validate_presence_of(:temperature)
      should validate_presence_of(:brewtime)    
    end
  end
end
