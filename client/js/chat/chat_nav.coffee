Template.chat_nav.events
  'click .back-button': (e, t) ->
    Router.go('events')

  'click .summary-button': (e, t) ->
    e.preventDefault()
    Router.go '/polls/' + Router.current().params._id
    false