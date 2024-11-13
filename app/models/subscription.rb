class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer
  validates :title, presence: true
  validates :price, presence: true, numericality: { message: "Price must be a number." }
  validates :frequency, presence: true
  validates :activestatus, inclusion: { in: [true, false] }
end
