@Suggestions = new Meteor.Collection null

Suggestions.insert({ tag: '#suggest.location', terms: ['#suggest.location', '#suggest', '#location'] })
Suggestions.insert({ tag: '#suggest.date', terms: ['#suggest.date', '#suggest', '#date'] })
Suggestions.insert({ tag: '#suggest.time', terms: ['#suggest.time', '#suggest', '#time'] })
Suggestions.insert({ tag: '#suggest.task', terms: ['#suggest.task', '#suggest', '#task'] })

TagPattern = /#[\w\. ]*/g

Suggestions.tags = (query) ->

  findLastHashTerm = (x) ->
    [first, ..., last] = x.match(TagPattern) || []
    last

  searchString = (string, term) ->
    string.search(new RegExp(term)) == 0

  searchTagTerms = (array, term) ->
    _.any array, (string) -> searchString(string, term)

  filterTagsByTerms = (tags, query) ->
    _.filter tags, (tag) -> searchTagTerms(tag.terms, query)

  if query = findLastHashTerm(query)
    tags = Suggestions.find().fetch()
    tags = filterTagsByTerms(tags, query)
    tags = _.pluck(tags, 'tag')
    tags unless tags.length == 0
