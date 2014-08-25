TransitionEndEvents = "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"

@showSuggestMenu = ->
  $('#suggest_menu').show()
  $('.gray-out')
    .transit({ opacity: 0, duration: 0 })
    .transit({ opacity: 1, duration: 200 })
  $('.menu')
    .transit({ y: '100%', duration: 0 })
    .transit({ y: '0', duration: 200 })

@hideSuggestMenu = ->
  $('.menu')
    .transit({ y: '100%', duration: 200 })
  $('.gray-out')
    .transit({ opacity: 0, duration: 200 })

  # bind to css transition end event
  suggestMenu = $('#suggest_menu')
  suggestMenu.bind TransitionEndEvents, ->
    suggestMenu.hide()
    suggestMenu.unbind()

Template.suggest_menu.events
  'click .gray-out': (e, t) ->
    e.preventDefault()
    false

  'click .cancel-button': (e, t) ->
    e.preventDefault()
    hideSuggestMenu()
    false
