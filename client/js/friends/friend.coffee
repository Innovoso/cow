addFriend = (email) ->
  Meteor.users.update Meteor.userId(), { $push: { 'profile.friends': email }}

Template.friend.helpers
  isFriend: (user) ->
    email = user.emails[0].address
    _.indexOf(Meteor.user().profile.friends, email) > -1

Template.friend.events
  'click .add-button': (e, t) ->
    e.preventDefault()
    userId = $(e.target).data('user-id')
    user = Meteor.users.findOne(userId)
    email = user.emails[0].address
    addFriend(email)
    false
