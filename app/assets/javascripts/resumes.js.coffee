# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

render_specializations = (specializations)->
  $('#specializations1').html("")
  $('#specializations2').html("")
  $('#specializations3').html("")
  i = 0
  nspecs = specializations.length
  for spec in specializations
    if i < nspecs / 3 
      $('#specializations1').append("<label class=\"checkbox\"><input class=\"check_boxes optional\" id=\"resume_specialization_ids_#{spec.id}\" name=\"resume[specialization_ids][]\" type=\"checkbox\" value=\"#{spec.id}\">#{spec.name}</label>")
    else if i >= nspecs / 3 and i < 2 * nspecs / 3 
      $('#specializations2').append("<label class=\"checkbox\"><input class=\"check_boxes optional\" id=\"resume_specialization_ids_#{spec.id}\" name=\"resume[specialization_ids][]\" type=\"checkbox\" value=\"#{spec.id}\">#{spec.name}</label>")
    else    
      $('#specializations3').append("<label class=\"checkbox\"><input class=\"check_boxes optional\" id=\"resume_specialization_ids_#{spec.id}\" name=\"resume[specialization_ids][]\" type=\"checkbox\" value=\"#{spec.id}\">#{spec.name}</label>")
    i += 1

jQuery ->
  $('#resume_area_id').on 'change', ->
    area_id = $(this).children("option:selected").attr('value')
    $.get "/specializations/#{area_id}", (specs) ->
      render_specializations(specs)
