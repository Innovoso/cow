Meteor.publish "messages", (options) ->
  Messages.find({}, fields: { name: 1, message: 1, time: 1, userId: 1 })