json.extract! order_item, :id, :qty, :price, :order_id, :item_id

json.item do
  json.partial! 'items/item', item: order_item.item
end
