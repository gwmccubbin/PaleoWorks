class AddPhoneToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :phone, :string
  end
end
