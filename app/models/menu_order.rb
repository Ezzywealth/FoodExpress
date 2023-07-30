class MenuOrder < ApplicationRecord
  validates :menuItem_id, presence: true
  validates :order_id, presence: true
  validates :quantity, presence: true
  validates :total_price, presence: true

  belongs_to :menuItem
  belongs_to :order
end
