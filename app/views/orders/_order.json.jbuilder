json.extract! order, :id, :customer_id, :location_id, :delivery_date, :confirmed, :created_at, :updated_at, :notes

json.order_items do
  json.array! order.order_items, partial: 'order_items/order_item', as: :order_item
end
