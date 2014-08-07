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

  'click #hash-button': (e, t) ->
    e.preventDefault()
    $('#message').caret('#')
    $('#message').trigger('keyup')
    false
