class RemoveCurrentFromMenus < ActiveRecord::Migration
  def change
    remove_column :menus, :current, :boolean
  end
end
