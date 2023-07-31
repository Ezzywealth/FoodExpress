class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, index: true, foreign_key:{to_table: :customers}
      t.references :payment, null: false, index: true, foreign_key:{to_table: :payments}
      t.integer :total_amount
      t.integer :total_quantity
      t.boolean :order_fufilled
      
      t.timestamps
    end
  end
end
