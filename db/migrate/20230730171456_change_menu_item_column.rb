class ChangeMenuItemColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :menu_orders, :menu_id, :menuItem_id
  end
end
