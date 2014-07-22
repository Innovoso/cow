Template.chat.messages = ->
  Messages.find {}, { sort: { time: -1 }}