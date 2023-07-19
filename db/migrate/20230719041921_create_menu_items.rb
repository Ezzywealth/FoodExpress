class CreateMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_items do |t|
      t.references :user, null: false, index: true, foreign_key:{to_table: :users}
      t.references :category, null: false, index: true, foreign_key: {to_table: :categories}
      t.references :subcategory, null: false, index: true, foreign_key: {to_table: :sub_categories}
      t.references :restaurant, null: false, index: true, foreign_key: {to_table: :restaurants}
      t.string :name 
      t.text :description
      t.integer :price
      t.timestamps
    end
  end
end
