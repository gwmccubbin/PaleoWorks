class Customer < ActiveRecord::Base
  has_many :addresses
  has_many :away_dates
  has_one :standard_order
  has_many :orders
  belongs_to :location
  accepts_nested_attributes_for :addresses, :standard_order

  validates :first_name, :last_name, presence: true
  validates :location, presence: true, unless: :delivery?
  validates :addresses, presence: true, if: :delivery?

  delegate :name, to: :location, prefix: true, allow_nil: true

  scope :active, -> { where(active: true) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def name
    "#{first_name} #{last_name}"
  end

  def address
    addresses.first
  end

  def delivery_address
    @delivery_location ||= if !delivery
      location.address
    elsif delivery
      addresses.first
    end    
  end

  def delivery_location_name
    @delivery_location_name ||= if !delivery
      location.name
    else
      "Custom Delivery"
    end
  end
end