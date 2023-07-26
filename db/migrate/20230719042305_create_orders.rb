class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, index: true, foreign_key: {to_table: :users}
      t.references :payment, index: true, foreign_key: {to_table: :payments}
      t.boolean :order_status
      t.integer :total      
      t.timestamps
    end
  end
end
