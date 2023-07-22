class Payment < ApplicationRecord
  validates :restaurant_id, presence: true
  validates :payment_status, presence: true
  validates :total_amount, presence: true
  validates :customer_id, presence: true
end
