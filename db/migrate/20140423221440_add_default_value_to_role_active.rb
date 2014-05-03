class AddDefaultValueToRoleActive < ActiveRecord::Migration
  def up
    change_column :roles, :active, :boolean, default: true
  end

  def down
    change_column :roles, :active, :boolean, default: nil
  end
end
