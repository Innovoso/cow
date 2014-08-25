TransitionTime = 200

@showSuggestMenu = ->
  $('#suggest_menu').show()
  $('.gray-out')
    .transit({ opacity: 0, duration: 0 })
    .transit({ opacity: 1, duration: TransitionTime })
  $('.menu')
    .transit({ y: '100%', duration: 0 })
    .transit({ y: '0', duration: TransitionTime })

@hideSuggestMenu = ->
  $('.menu')
    .transit({ y: '100%', duration: TransitionTime })
  $('.gray-out')
    .transit({ opacity: 0, duration: TransitionTime })

  $('#suggest_menu').delay(TransitionTime).hide(0)


Template.suggest_menu.events
  'click .gray-out': (e, t) ->
    e.preventDefault()
    false

  'click .cancel-button': (e, t) ->
    e.preventDefault()
    hideSuggestMenu()
    false
