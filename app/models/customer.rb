class Customer < ApplicationRecord
  has_many :subscription
  has_many :tea, through: :subscription

  validates :firstname, :lastname, :email, :address, presence: true
end
