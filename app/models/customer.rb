class Customer < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  has_one :address
  has_many :customer_locations
  has_many :locations, through: :customer_locations
  has_many :customer_away_times
  has_many :away_times, through: :customer_away_times
  has_many :customer_recurring_orders
  has_many :recurring_orders, through: :customer_recurring_orders

  def full_name
    "#{first_name} #{last_name}"
  end

  def location
    locations.first
  end

  def location_name
    if locations.any?
      locations.first.name
    else
      'N/A'
    end
  end
end