loaderf = ->
  $('.long, .longpaginate .page a, .longpaginate .next a, .longpaginate .prev a, .longpaginate .last a, .longpaginate .first a').on 'click', ->
    $('#loader').modal('show')
    true
  true
$(document).ready loaderf
$(document).on 'page:load', loaderf

ready = ->
  $("[data-masked=size]").mask('99x99x99')
  $("[data-masked=date]").mask('99.99.9999')
  $("[data-masked=number]").mask('(999)999-99-99')
  false
$(document).ready ready
$(document).on 'page:load', ready

selectactive = ->
  $(".selectpicker").selectpicker()
  $(".selectpicker[data-value]").each ->
    $(this).selectpicker 'val', $(this).data('value')
    false
$(document).ready selectactive
$(document).on 'page:load', selectactive

dtpick = ->
  $('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})
  $('.timepicker').datetimepicker({locale: 'ru', format: 'HH:mm'})
  false
$(document).ready dtpick
$(document).on 'page:load', dtpick

ready = ->
  $("[data-toggle='popover']").popover()
$(document).ready ready
$(document).on 'page:load', ready

tool = ->
  $('[data-toggle="tooltip"]').tooltip()
$(document).ready tool
$(document).on 'page:load', tool

carous = ->
  $('#slide-images').carousel()
$(document).ready carous
$(document).on 'page:load', carous
