$(document).ready ->
  # jQuery Select2
  $('#e2').select2 { placeholder: 'Select a Gym Location', allowClear: true }
  
  # Custom Delivery
  $('#customDelivery').hide()
  $('#customDelivery').find('input').attr('disabled', 'disabled')

  $('#selectCustomDelivery').click ->
    if $('#gymDelivery').is(':hidden')
      $('select', '#gymDelivery').removeAttr('disabled')
    else
      $('select', '#gymDelivery').attr('disabled', 'disabled')

    if $('#customDelivery').is(':hidden')
      $('#customDelivery').find('input').removeAttr('disabled')
    else
      $('#customDelivery').find('input').attr('disabled', 'disabled')

    $('#gymDelivery').slideToggle()
    $('#customDelivery').slideToggle()

  # Standard Order
  $('#standardOrder').hide()  
  $('#standardOrder').find('input, textarea').attr('disabled', 'disabled')

  $('#selectStandardOrder').click ->
    if $('#standardOrder').is(':hidden')
      $('#standardOrder').find('input, textarea').removeAttr('disabled')
    else
      $('#standardOrder').find('input, textarea').attr('disabled', 'disabled')

    $('#standardOrder').slideToggle()