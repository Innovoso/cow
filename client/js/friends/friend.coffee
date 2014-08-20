Template.friend.helpers
  isFriend: (user) ->
    email = user.emails[0].address
    _.indexOf(Meteor.user().profile.friends, email) > -1

Template.friend.events
  'click .add-button': (e, t) ->
    alert 'lala'