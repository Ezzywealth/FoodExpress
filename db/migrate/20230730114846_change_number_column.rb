class ChangeNumberColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :customers, :number, :bigint
  end
end
