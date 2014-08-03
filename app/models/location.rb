class Location < ActiveRecord::Base
  has_one :address
  has_many :customers
  has_many :orders

  accepts_nested_attributes_for :address

  validates :name, presence: true

  scope :top, ->(n) {
    select('locations.id, locations.name, orders.location_id, count(orders.location_id) as order_count')
    .joins(:orders)
    .group("locations.id, orders.location_id")
    .order('order_count DESC')
    .limit(n)
  }

  def street_address
    if address.address2
      "#{address.address1} #{address.address2}, #{address.zip}"
    else
      "#{address.address1}, #{address.zip}"
    end
  end
end