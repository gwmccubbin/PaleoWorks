@OrdersApp = angular.module 'Orders', ['ui.select2', 'ui.bootstrap', 'rails']
@OrdersApp.controller 'OrderFormController', ($scope, Item, Order, OrderItem) ->
  $scope.orderItems = []
  $scope.initialize = (id) ->
    Item.query().then (items) -> $scope.items = items
    OrderItem.query(null, {orderId: id}).then (orderItems) ->
      $scope.orderItems = orderItems
    $scope.dateObject = Date.future('Monday')

  $scope.addOrderItem = () ->
    $scope.orderItems.push(new OrderItem())

  $scope.checkOrderItemsPresent = () ->
    $scope.orderItems.length >= 1

  $scope.updatePrice = (orderItem) ->
    Item.get(orderItem.itemId).then (item) ->
      orderItem.price = item.price

  $scope.today = ->
    $scope.dateObject = new Date()

  $scope.clear = ->
    $scope.dateObject = null

  $scope.toggleMin = () ->
    $scope.minDate = $scope.minDate ? null : new Date();


  $scope.open = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()

    $scope.opened = true;

  $scope.minDate = new Date();

  $scope.dateOptions = {
    formatYear: 'yy',
    startingDay: 1
  }

  $scope.initDate = new Date('2016-15-20')
  $scope.format = 'EEEE, MMMM dd, yyyy'



@OrdersApp.factory 'Order', (railsResourceFactory) ->
  orders = railsResourceFactory({url: '/orders', name: 'order'})

@OrdersApp.factory 'OrderItem', (railsResourceFactory) ->
  order_items = railsResourceFactory(url: '/orders/{{orderId}}/order_items/{{id}}', name: 'order_item')

@OrdersApp.factory 'Item', (railsResourceFactory) ->
  items = railsResourceFactory(url: '/items', name: 'item')
