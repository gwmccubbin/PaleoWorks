class AddMealIdAndItemIdToMealItems < ActiveRecord::Migration
  def change
    add_column :meal_items, :meal_id, :integer
    add_column :meal_items, :item_id, :integer
  end
end
