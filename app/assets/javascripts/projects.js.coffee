# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

refresh_select = ->
  $('.project_scopes').on 'change', ->
    scope_id = $(this).children("option:selected").attr('value')
    table = this
    $.get "/specializations/#{scope_id}", (specs) ->
      render_specializations($(table).siblings('table.specializations'), specs)

render_specializations = (table, specializations)->
  $(table).find('.specializations1').html("")
  $(table).find('.specializations2').html("")
  $(table).find('.specializations3').html("")
  i = 0
  nspecs = specializations.length
  for spec in specializations
    if i < nspecs / 3 
      $(table).find('.specializations1').append("<label class=\"checkbox\"><input class=\"check_boxes optional\" id=\"project_specialization_ids_#{spec.id}\" name=\"project[specialization_ids][]\" type=\"checkbox\" value=\"#{spec.id}\">#{spec.name}</label>")
    else if i >= nspecs / 3 and i < 2 * nspecs / 3 
      $(table).find('.specializations2').append("<label class=\"checkbox\"><input class=\"check_boxes optional\" id=\"project_specialization_ids_#{spec.id}\" name=\"project[specialization_ids][]\" type=\"checkbox\" value=\"#{spec.id}\">#{spec.name}</label>")
    else    
      $(table).find('.specializations3').append("<label class=\"checkbox\"><input class=\"check_boxes optional\" id=\"project_specialization_ids_#{spec.id}\" name=\"project[specialization_ids][]\" type=\"checkbox\" value=\"#{spec.id}\">#{spec.name}</label>")
    i += 1


jQuery -> 
  for input in $('.datetime')
    $(input).datetimepicker
      dateFormat: 'dd.mm.yy'
  refresh_select()
  $('#add_project_scope').on 'click', ->
    $(this).before "
      <fieldset>
        <select class=\"project_scopes\" id=\"project_project_scope_ids_#{gon.scope_id}_scope_id\" name=\"project[project_scope_ids][#{gon.scope_id}][scope_id]\">
        <option value=\"\" selected=\"selected\"></option>
        #{for scope in gon.scopes then "<option value=\"#{scope.id}\">#{scope.name}</option>"}
        <input id=\"project_project_scope_ids_#{gon.scope_id}__destroy\" name=\"project[project_scope_ids][#{gon.scope_id}][_destroy]\" type=\"hidden\" value=\"false\">
        <a href=\"#\" class=\"remove_fields\">Удалить</a>
        <table class=\"specializations\">
          <tbody><tr>
            <td class=\"specializations1\"></td>
            <td class=\"specializations2\"></td>
            <td class=\"specializations3\"></td>
          </tr></tbody>
        </table>    
      </fieldset>"
    gon.scope_id += 1
    refresh_select()
    false