class AddUuidToBudgetList < ActiveRecord::Migration[7.0]
  def change
    add_column :budget_lists, :uuid, :uuid, default: -> { "gen_random_uuid()" }
    add_index :budget_lists, :uuid, unique: true
  end
end
