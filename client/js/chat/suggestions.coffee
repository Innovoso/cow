haveSuggestions = -> Suggestions.shortlist().length > 0

replaceCurrentSmartTag = (value) ->
  input = messageField()
  if curSmartTag = Session.get('currentSmartTag')
    input.range(curSmartTag.start, curSmartTag.end)
    input.range(value)
  input.caret(input.range().end - 1)
  input.trigger('keyup')

Template.suggestions.helpers
  show: -> haveSuggestions()
  suggestions: -> Suggestions.shortlist()

Template.suggestions.events
  'click .suggestion': (e, t) ->
    e.preventDefault()
    value = $(e.target).data('value')
    replaceCurrentSmartTag(value)
    false
