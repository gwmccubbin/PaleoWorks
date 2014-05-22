class DropMealItemAndMeal < ActiveRecord::Migration
  def change
    drop_table :meal_items
    drop_table :meals
  end
end
