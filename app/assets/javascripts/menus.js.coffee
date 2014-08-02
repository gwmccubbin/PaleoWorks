@MenusApp = angular.module 'Menus', ['ui.bootstrap']
@MenusApp.controller 'MenuFormController', ($scope) ->
  $scope.initialize =  ->
    $scope.startDateObject = Date.future('Monday')
    $scope.endDateObject = Date.future('Monday').addDays(6)

  $scope.today = ->
    $scope.dateObject = new Date()

  $scope.clear = ->
    $scope.dateObject = null

  $scope.openStartDate = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()

    $scope.startDateOpen = true;

  $scope.openEndDate = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()

    $scope.endDateOpen = true;

  $scope.minDate = new Date();

  $scope.dateOptions = {
    formatYear: 'yy',
    startingDay: 1
  }

  $scope.initDate = new Date('2016-15-20')
  $scope.format = 'EEEE, MMMM dd, yyyy'
