@CustomersApp = angular.module 'Customers', ['ui.select2']
@CustomersApp.controller 'CustomerFormController', ($scope) ->

@CustomersApp.controller 'CustomerModalFormController', ($scope) ->
  $scope.checkValidation = () ->

@CustomersApp.directive 'disableChildren', () ->
  link: (scope, element, lattrs) ->
    scope.$watch lattrs['disableChildren'], (value) ->
      if value
        element.find('input, textarea').attr('disabled', 'disabled')
      else
        element.find('input, textarea').removeAttr('disabled')

    return