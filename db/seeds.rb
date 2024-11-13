# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

customer1 = Customer.create!(firstname: "Mr.", lastname: "Thirsty", email: "MrT@example.com", address: "Hollywood")
customer2 = Customer.create!(firstname: "Ice", lastname: "T", email: "IceT@example.com", address: "California")

tea1 = Tea.create!(title: "Rooibos", description: "yum", temperature: 120, brewtime: 12)
tea2 = Tea.create!(title: "Chai", description: "elite", temperature: 135, brewtime: 8)
tea3 = Tea.create!(title: "Oolong", description: "peace", temperature: 140, brewtime: 9)
tea4 = Tea.create!(title: "Southern Ice Tea", description: "lethally sweet", temperature: 40, brewtime: 19)
tea5 = Tea.create!(title: "Puer", description: "power", temperature: 122, brewtime: 15)

subscription1 = Subscription.create!(title: "Chai of the Tiger", price: 19.99, activestatus: true, frequency: "Monthly", customer: customer1, tea: tea2)
subscription2 = Subscription.create!(title: "Kanga-Rooibos", price: 25.99, activestatus: false, frequency: "Daily", customer: customer2, tea: tea1)
subscription3 = Subscription.create!(title: "Move Oolong", price: 10.99, activestatus: true, frequency: "Weekly", customer: customer2, tea: tea3)
subscription4 = Subscription.create!(title: "Sweet Dixie", price: 11.50, activestatus: true, frequency: "Monthly", customer: customer2, tea: tea4)
subscription5 = Subscription.create!(title: "Might-Tea Caffinated", price: 22.50, activestatus: false, frequency: "Weekly", customer: customer1, tea: tea5)