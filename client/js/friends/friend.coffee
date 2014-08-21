addFriend = (email) ->
  Meteor.users.update Meteor.userId(), { $push: { 'profile.friends': email }}

slideOpen = (target) ->
  $(target).transit { x: '-25%' }

slideClose = (target) ->
  $(target).transit { x: 0 }

Template.friend.rendered = ->
  $('.friend').swipe
    swipeLeft: (e) ->
      e.preventDefault()
      slideOpen(e.currentTarget)
    swipeRight: (e) ->
      e.preventDefault()
      slideClose(e.currentTarget)
    tap: (e) ->
      e.preventDefault()
      slideClose(e.currentTarget)

Template.friend.events
  'click .add-button': (e, t) ->
    e.preventDefault()
    userId = $(e.target).data('user-id')
    user = Meteor.users.findOne(userId)
    email = user.emails[0].address
    addFriend(email)
    false
