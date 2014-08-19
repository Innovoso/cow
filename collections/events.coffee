@Events = new Meteor.Collection('events')
# Events.after.insert (userId, doc) ->
#  eventId = doc._id
#  chatId = "chat-" + eventId
#  chatCollection = new Meteor.Collection(chatId)
#  chatCollection.remove(chatCollection.insert { temp: "temp" })
