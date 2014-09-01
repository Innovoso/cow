Deps.autorun () ->
  Meteor.subscribe 'friendsSearch', Session.get('friendQuery')

Template.friends_new.events
  'click .search-button': (e, t) ->
    e.preventDefault()
    $('form').trigger 'submit'
    false

  'submit form': (e, t) ->
    e.preventDefault()
    email = t.find('#email').value
    Session.set('friendQuery', email)
    false

Template.friends_new.helpers
  friends: (email) -> Meteor.users.find()

  isMe: (user) -> user._id == Meteor.userId()

