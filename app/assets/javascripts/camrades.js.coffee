# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


split = (val) ->
  val.split /,\s*/
extractLast = (term) ->
  split(term).pop()


options = 
  source: (request, response) ->
    $.getJSON "/specializations",
      term: extractLast(request.term)
    , response
    
  search: ->

    # custom minLength
    term = extractLast(@value)
    false  if term.length < 0

  focus: ->

    # prevent value inserted on focus
    false

  select: (event, ui) ->
    terms = split(@value)

    # remove the current input
    terms.pop()

    # add the selected item
    terms.push ui.item.value

    # add placeholder to get the comma-and-space at the end
    terms.push ""
    @value = terms.join(", ")
    false
  minLength: 0
      
reactivate_on_resume_add = ->
  $('.date_field').datepicker
    showOn: 'button'
    buttonImage: '/assets/calendar.gif'
    buttonImageOnly: true
    dateFormat: 'dd.mm.yy'
    changeMonth: true
    changeYear: true
    yearRange: "1900:2012"

jQuery ->
  reactivate_on_resume_add()
  
  for input in $('.specialization_names')
    $(input).bind("keydown", (event) ->
      event.preventDefault()  if event.keyCode is $.ui.keyCode.TAB and $(this).data("autocomplete").menu.active
    ).catcomplete options
      
  $('form').on 'click', '.return_resume_fields', (event) ->
    $(this).prev('fieldset').children('input[type=hidden]').val('0')
    $(this).prev('fieldset').toggle()
    $(this).toggle()
    event.preventDefault()
  
  $('form').on 'click', '.remove_resume_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.resume_field').children('.return_resume_fields').toggle()
    $(this).closest('fieldset').toggle()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    reactivate_on_resume_add
    event.preventDefault()


$.widget "custom.catcomplete", $.ui.autocomplete,
  _renderMenu: (ul, items) ->
    self = this
    currentCategory = ""
    $.each items, (index, item) ->
      unless item.category is currentCategory
        ul.append "<li class='ui-autocomplete-category'>#{item.category}</li>"
        currentCategory = item.category
      self._renderItem ul, item