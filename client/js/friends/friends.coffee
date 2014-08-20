Template.friends.helpers
  friends: ->
    friends = Meteor.users.find()

  isMe: (user) -> user._id == Meteor.userId()
