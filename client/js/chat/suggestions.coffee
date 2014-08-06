Template.suggestions.helpers
  tags: (filter) ->
    Suggestions.tags(filter)
  filter: ->
    Session.get('smartFilter')