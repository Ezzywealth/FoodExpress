class MenuOrder < ApplicationRecord
  validates :menuItem_id, presence: true
  validates :order_id, presence: true
  validates :quantity, presence: true
  validates :total_price, presence: true

  belongs_to :menuItem
  belongs_to :order

  after_save :update_total_amount

  private

  def update_total_amount
    total = order.menu_orders.sum(:total_price)
    order.update(total_amount: total)
  end
end
