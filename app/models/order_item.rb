class OrderItem < ActiveRecord::Base
  belongs_to :order 
  belongs_to :item

  delegate :id, :name, :price, to: :item, prefix: true

  class << self
    def dashboard_summary
      select('items.name, item_types.name as item_type_name, sum(order_items.qty) as total_quantity')
      .joins(:order)
      .joins(:item)
      .joins(item: :item_type)
      .group('items.id, item_types.name')
      .merge(Order.current).group_by { |oi| oi.item_type_name }
    end
  end
end
