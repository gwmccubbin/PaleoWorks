class CustomerAwayDate < ActiveRecord::Base
  belongs_to :customer, :away_date
  validates :customer_id, uniqueness: { scope: [:away_date_id] }
end
