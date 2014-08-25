@messageField = -> $('#message')

caretPositionChanged = (input_field) ->
  Session.set('currentSmartTag', currentSmartTag(input_field))

Template.chat_box.helpers
  showHashButton: -> !Session.get('currentSmartTag')

Template.chat_box.events

  'keydown #message': (e, t) ->
    if e.which == 9
      console.log "tab detected"
      e.preventDefault()

  'keyup #message': (e, t) ->
    caretPositionChanged $(e.target)

  'click #message': (e, t) ->
    caretPositionChanged $(e.target)

  'click #hash-button': (e, t) ->
    input = messageField()
    input.caret('#')
    input.trigger('keyup')

  'click #map-button': (e, t) ->
    e.preventDefault()
    showSuggestMenu()
    false
