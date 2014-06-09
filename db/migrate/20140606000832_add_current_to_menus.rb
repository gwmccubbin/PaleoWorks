class AddCurrentToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :current, :boolean, default: false
  end
end
