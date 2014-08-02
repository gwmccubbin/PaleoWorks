class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :location
  has_many :order_items, dependent: :destroy

  validates :customer, presence: true
  validates :delivery_date, presence: true

  after_save :set_location_id

  accepts_nested_attributes_for :order_items, allow_destroy: true

  delegate :delivery_address, :delivery_location_name, to: :customer, prefix: true, allow_nil: true


  private

  def set_location_id
    if location_id.nil?
      if !customer.delivery && customer.location.present?
        update(location_id: customer.location.id)   
      end
    end
  end
end