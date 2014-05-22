class Customer < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  has_many :addresses
  has_many :away_dates
  has_many :standard_orders
  has_many :orders
  has_many :customer_locations
  has_many :locations, through: :customer_locations

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