Template.friends.helpers
  friends: ->
    friends = Meteor.users.find()
