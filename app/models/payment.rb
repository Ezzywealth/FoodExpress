class Payment < ApplicationRecord
  # validates :restaurant_id, presence: true
  validates :fulfilled, inclusion: {in:[true,false]}
  validates :total_amount, presence: true
  validates :customer_id, presence: true

  has_many :orders
  has_many :restaurant_orders

  belongs_to :customer
end
