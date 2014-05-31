class DropMealTypesAndItemMealTypes < ActiveRecord::Migration
  def change
    drop_table :meal_types
    drop_table :item_meal_types
  end
end
