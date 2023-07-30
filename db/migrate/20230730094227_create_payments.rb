class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :customer, null: false, index: true, foreign_key:{to_table: :customers}
      t.boolean :payment_fulfilled
      t.integer :total_amount
      t.timestamps
    end
  end
end
