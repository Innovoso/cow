@Suggestions = new Meteor.Collection null

Suggestions.insert({ type: 'location', name: '#suggest.location()' })
Suggestions.insert({ type: 'date', name: '#suggest.date()' })
Suggestions.insert({ type: 'time', name: '#suggest.time()' })
Suggestions.insert({ type: 'task', name: '#suggest.task()' })

fuzzySearch = (searchTerm, objects, fieldToSearch) ->
  pattern = searchTerm.replace(/\s+/g, '').split('').join('.*')
  _.filter objects, (object) ->
    object[fieldToSearch].match(new RegExp(pattern, 'i'))

Suggestions.shortlist = ->
  if tag = Session.get('currentSmartTag')
    tags = Suggestions.find().fetch()
    fuzzySearch(tag.name, tags, "name")
  else []
