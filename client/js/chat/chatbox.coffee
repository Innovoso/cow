Template.chatbox.events
  'keyup #message': (e, t) ->

    message = e.target.value
    Session.set('smartFilter', message)
    tags = Suggestions.tags(message)

    if tags
      $('#suggestions').show()
    else
      $('#suggestions').hide()
      Session.set('smartFilter', '')
