class CreateBudgetLists < ActiveRecord::Migration[7.0]
  def change
    create_table :budget_lists do |t|
          t.string :name
          t.float :amount
          t.string :status
          t.string :category
          t.boolean :allow_overspending
          t.string :frequency
          t.date :start_date
          t.date :end_date
          t.text :notes
          t.timestamps
    end
  end
end
