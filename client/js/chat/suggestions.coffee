haveSuggestions = -> Suggestions.shortlist().length > 0

Template.suggestions.helpers
  suggestions: -> Suggestions.shortlist()
  show: -> haveSuggestions()
