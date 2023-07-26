class CreateSubCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_categories do |t|
      t.references :user, null: false, index: true, foreign_key:{to_table: :users}
      t.references :category, null: false, index: true, foreign_key:{to_table: :categories}
      t.string :name
      t.timestamps
    end
  end
end
