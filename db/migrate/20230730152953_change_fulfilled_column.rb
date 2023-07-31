class ChangeFulfilledColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :payments, :payment_fulfilled, :fulfilled
    rename_column :orders, :order_fufilled, :fulfilled
  end
end
