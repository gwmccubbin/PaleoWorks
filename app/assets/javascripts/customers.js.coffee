@CustomersApp = angular.module 'Customers', []
@CustomersApp.controller 'CustomerFormController', ($scope) ->

@CustomersApp.directive 'disableChildren', () ->
  link: (scope, element, lattrs) ->
    scope.$watch lattrs['disableChildren'], (value) ->
      if value
        element.find('input, textarea').attr('disabled', 'disabled')
      else
        element.find('input, textarea').removeAttr('disabled')

    return

@CustomersApp.animation '.hideable', () ->
  return {
  addClass: (element, done) ->
    jQuery(element).slideUp('400', done)
    return
  removeClass: (element, done) ->
    jQuery(element).slideDown('400', done)
    return
  }