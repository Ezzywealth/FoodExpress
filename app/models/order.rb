class Order < ApplicationRecord
  validates :customer_id, presence: true
  # validates :restaurant_id, presence: true
  validates :payment_id, presence: true
  # validates :quantity, presence: true
  validates :total_amount, presence: true
  validates :fulfilled, inclusion: { in: [true, false] }
  has_many :menu_orders, class_name: 'MenuOrder'
  has_many :menuItems, through: :menu_orders
  has_many :restaurant_orders

  belongs_to :customer
  belongs_to :payment
end
