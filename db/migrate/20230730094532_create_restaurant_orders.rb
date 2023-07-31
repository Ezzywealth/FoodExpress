class CreateRestaurantOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_orders do |t|
      t.references :customer, null: false, index: true, foreign_key:{to_table: :customers}
      t.references :menuItem, null: false, index: true, foreign_key:{to_table: :menu_items}
      t.references :restaurant, null: false, index: true, foreign_key:{to_table: :restaurants}
      t.references :payment, null: false, index: true, foreign_key:{to_table: :payments}
      t.integer :quantity
      t.integer :price
      t.timestamps
    end
  end
end
