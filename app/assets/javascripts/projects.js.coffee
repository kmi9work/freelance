# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

refresh_select = ->
  $('.project_areas').on 'change', ->
    area_id = $(this).children("option:selected").attr('value')
    table = this
    $.get "/specializations/#{area_id}", (specs) ->
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
  $('#add_project_area').on 'click', ->
    $(this).before "
      <fieldset>
        <select class=\"project_areas\" id=\"project_project_area_ids_#{gon.area_id}_area_id\" name=\"project[project_area_ids][#{gon.area_id}][area_id]\">
        <option value=\"\" selected=\"selected\"></option>
        #{for area in gon.areas then "<option value=\"#{area.id}\">#{area.name}</option>"}
        <input id=\"project_project_area_ids_#{gon.area_id}__destroy\" name=\"project[project_area_ids][#{gon.area_id}][_destroy]\" type=\"hidden\" value=\"false\">
        <a href=\"#\" class=\"remove_fields\">Удалить</a>
        <table class=\"specializations\">
          <tbody><tr>
            <td class=\"specializations1\"></td>
            <td class=\"specializations2\"></td>
            <td class=\"specializations3\"></td>
          </tr></tbody>
        </table>    
      </fieldset>"
    gon.area_id += 1
    refresh_select()
    false