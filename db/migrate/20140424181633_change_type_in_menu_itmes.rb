class ChangeTypeInMenuItmes < ActiveRecord::Migration
  def up
    rename_column :menu_items, :type, :meal_type
  end

  def down
    rename_column :menu_items, :meal_type, :type
  end
end
