class CreateMenuOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_orders do |t|
      t.references :menu, null: false, index: true, foreign_key:{to_table: :menu_items}
      t.references :order, null: false, index: true, foreign_key:{to_table: :orders}
      t.integer :quantity
      t.integer :total_price
      
      t.timestamps
    end
  end
end
