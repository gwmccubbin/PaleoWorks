class AddNameToItemType < ActiveRecord::Migration
  def change
    add_column :item_types, :name, :string
  end
end
