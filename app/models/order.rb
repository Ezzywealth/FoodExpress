class Order < ApplicationRecord
  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  validates :payment_id, presence: true
  validates :quantity, presence: true
  validates :total_amount, presence: true
  validates :order_status, presence: true

end
