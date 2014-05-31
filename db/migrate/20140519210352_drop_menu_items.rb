class DropMenuItems < ActiveRecord::Migration
  def change
    drop_table :menu_items
  end
end
