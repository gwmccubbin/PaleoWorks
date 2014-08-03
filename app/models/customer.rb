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
  scope :recent, ->(n) { order('created_at DESC').limit(n) }
  scope :recurring, -> { joins(:standard_order).where(StandardOrder.arel_table[:recurring].eq(true)) }


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

  def recurring?
    if standard_order.present?
      standard_order.recurring?
    end
  end

  class << self
    def active_count
      where(active: true).count
    end

    def inactive_count
      where(active: false).count
    end
  end
end