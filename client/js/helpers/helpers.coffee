Handlebars.registerHelper 'prettyDate', (timestamp) ->
  # new Date(timestamp)
  moment(timestamp).format('h:mm a')