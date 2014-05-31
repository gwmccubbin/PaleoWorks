class AddNameToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :name, :string
  end
end
