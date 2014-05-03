class AwayDate < ActiveRecord::Base
  has_many :customer_away_dates
  has_many :customers, through: :customer_away_dates
end

