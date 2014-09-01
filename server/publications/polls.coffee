Meteor.publish "polls", (chatId) ->
  Polls.find({chat_id: chatId})


