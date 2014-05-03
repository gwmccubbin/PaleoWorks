class CreateCustomerAwayDates < ActiveRecord::Migration
  def change
    create_table :customer_away_dates do |t|
      t.integer :customer_id
      t.integer :away_date_id

      t.timestamps
    end
  end
end
