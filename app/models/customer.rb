class Customer < ApplicationRecord
  has_many :subscription
  has_many :tea, through: :subscription
end
