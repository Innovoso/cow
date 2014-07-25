Template.friends.helpers
  friends: ->
    friends = Meteor.users.find({}, {fields: { emails: 1 }})
    console.log friends.fetch()[0]
    friends