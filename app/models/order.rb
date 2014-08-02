class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :location
  has_many :order_items
  has_many :items, through: :order_items

  after_save :set_location_id

  accepts_nested_attributes_for :order_items, allow_destroy: true
end

  private

  def set_location_id
    if location_id.nil?
      if !customer.delivery && customer.location.present?
        update(location_id: customer.location.id)   
      end
    end
  end
end