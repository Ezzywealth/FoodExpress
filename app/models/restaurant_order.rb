class RestaurantOrder < ApplicationRecord
  validates :customer_id, presence: true
  validates :menuItem_id, presence: true
  validates :quantity, presence: true
  validates :restaurant_id, presence: true
  validates :price, presence: true
  validates :payment_id, presence: true

  belongs_to :customer
  belongs_to :menuItem
  belongs_to :restaurant
  belongs_to :payment
end
