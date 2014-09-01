TransitionTime = 200

@showSuggestMenu = ->
  $('#chat_menu').show()
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

  $('#chat_menu').delay(TransitionTime).hide(0)


Template.chat_menu.events
  'click .gray-out': (e, t) ->
    e.preventDefault()
    false

  'click .cancel-button': (e, t) ->
    e.preventDefault()
    hideSuggestMenu()
    false

  'click .vote-button': (e, t) ->
    e.preventDefault()
    id = Router.current().params._id
    Router.go('/poll_new/' + id)
    false
