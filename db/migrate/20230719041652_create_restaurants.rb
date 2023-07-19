class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.references :user, null: false, index: true, foreign_key:{to_table: :users}
      t.string :name 
      t.text :description 
      t.timestamps
    end
  end
end
