tenant_changer = ->
  $('#tenant_type_select').on 'change', ->
    old_act = $(this).closest('form').attr('action')
    old_met = $(this).closest('form').attr('method')
    new_act = $(this).closest('form').attr('data-url')
    $(this).closest('form').attr('action', new_act)
    $(this).closest('form').attr('data-remote', 'true')
    $(this).closest('form').attr('method', 'get')
    $(this).closest('form').submit()
    $(this).closest('form').removeAttr('data-remote')
    $(this).closest('form').removeData('remote')
    $(this).closest('form').attr('action', old_act)
    $(this).closest('form').attr('method', old_met)
    true
  true
$(document).ready tenant_changer
$(document).on 'page:load', tenant_changer
