class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer
  validates :title, :price, :frequency, presence: true
  validates :activestatus, inclusion: { in: [true, false] }
end
