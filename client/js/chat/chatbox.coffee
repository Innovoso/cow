@messageField = -> $('#message')

caretPositionChanged = (input_field) ->
  Session.set('currentSmartTag', currentSmartTag(input_field))

Template.chatbox.events

  'keyup #message': (e, t) ->
    caretPositionChanged $(e.target)

  'click #message': (e, t) ->
    caretPositionChanged $(e.target)

  'click #hash-button': (e, t) ->
    input = messageField()
    input.caret('#')
    input.trigger('keyup')
