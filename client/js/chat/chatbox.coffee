HashKey = 35

Template.chatbox.events
  'keypress #message': (e, t) ->
    if e.which == HashKey
      console.log '#'