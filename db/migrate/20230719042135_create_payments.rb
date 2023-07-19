class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
    t.references :user, null: false, index: true, foreign_key: {to_table: :users}
    t.boolean :status, null: false
    t.integer :total     
    t.timestamps
    end
  end
end
