class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer
  validates :title, :price, :activestatus, :frequency, presence: true
end
