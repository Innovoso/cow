Template.chat.helpers
  messages: ->
    messages = Messages.find({}, { sort: { time: -1 }})
    console.log messages.fetch()
    messages

