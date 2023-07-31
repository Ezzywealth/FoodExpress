class Customer < ApplicationRecord
  has_many :orders
  has_many :payments
  has_many :restaurant_orders

  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :number, presence: true
end
