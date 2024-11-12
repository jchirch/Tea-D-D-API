require "rails_helper"

RSpec.describe "Subscription Endpoints" do
  before(:each) do
    @customer1 = Customer.create!(firstname: "Mr.", lastname: "Thirsty", email: "MrT@example.com", address: "Hollywood")
    @customer2 = Customer.create!(firstname: "Ice", lastname: "T", email: "IceT@example.com", address: "California")
    
    @tea1 = Tea.create!(title: "Rooibos", description: "yum", temperature: 120, brewtime: 12)
    @tea2 = Tea.create!(title: "Chai", description: "elite", temperature: 135, brewtime: 8)
    
    @subscription1 = Subscription.create!(title: "Chai of the Tiger", price: 19.99, activestatus: true, frequency: "Monthly", customer: @customer1, tea: @tea1)
    @subscription2 = Subscription.create!(title: "Kanga-Rooibos", price: 25.99, activestatus: false, frequency: "Daily", customer: @customer2, tea: @tea2)
  end
  describe 'Happy Path' do
    it 'can retrieve all subscriptions' do
      get "/api/v1/subscriptions"
      expect(response).to be_successful

      subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]

      subscriptions.each do |sub|
        expect(sub).to have_key(:id)
        expect(sub[:type]).to eq("subscription")
        expect(sub[:attributes]).to have_key(:title)
        expect(sub[:attributes]).to have_key(:price)
        expect(sub[:attributes]).to have_key(:activestatus)
        expect(sub[:attributes]).to have_key(:frequency)
      end
    end

    it 'returns a subscription and its attributes' do
      get "/api/v1/subscriptions/#{@subscription1.id}"

      expect(response).to be_successful

      subscription = JSON.parse(response.body, symbolize_names: true)[:data]
      # require 'pry'; binding.pry
      expect(subscription).to have_key(:id)
      expect(subscription[:type]).to eq("subscription")
      expect(subscription[:attributes][:title]).to eq(@subscription1.title)
      expect(subscription[:attributes][:price]).to eq(@subscription1.price)
      expect(subscription[:attributes][:activestatus]).to eq(@subscription1.activestatus)
      expect(subscription[:attributes][:frequency]).to eq(@subscription1.frequency)

      expect(subscription[:relationships][:tea][:data][:id].to_i).to eq(@tea1.id)
      expect(subscription[:relationships][:customer][:data][:id].to_i).to eq(@customer1.id)
    end
  end 
end
