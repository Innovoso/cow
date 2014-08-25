Template.suggest_menu.events
  'click .gray-out': (e, t) ->
    e.preventDefault()
    false

  'click .cancel-button': (e, t) ->
    e.preventDefault()
    $('#suggest_menu').hide()
    false
