@OrdersApp = angular.module 'Orders', ['ui.select2', 'rails']
@OrdersApp.controller 'OrderFormController', ($scope, Item, Order, OrderItem) ->
  $scope.orderItems = []
  $scope.initialize = (id) ->
    Item.query().then (items) -> $scope.items = items
    OrderItem.query(null, {orderId: id}).then (orderItems) ->
      $scope.orderItems = orderItems

  $scope.addOrderItem = () ->
    $scope.orderItems.push(new OrderItem())


@OrdersApp.factory 'Order', (railsResourceFactory) ->
  orders = railsResourceFactory({url: '/orders', name: 'order'})

@OrdersApp.factory 'OrderItem', (railsResourceFactory) ->
  order_items = railsResourceFactory(url: '/orders/{{orderId}}/order_items/{{id}}', name: 'order_item')

@OrdersApp.factory 'Item', (railsResourceFactory) ->
  items = railsResourceFactory(url: '/items', name: 'item')
