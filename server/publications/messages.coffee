Meteor.publish "messages", (chatId) ->
  Messages.find({chatId: chatId}, fields: { name: 1, message: 1, time: 1, userId: 1 })