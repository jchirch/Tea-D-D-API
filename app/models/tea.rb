class Tea < ApplicationRecord
  has_many :subscription
  validates :title, :description, :temperature, :brewtime, presence: true
end
