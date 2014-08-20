Template.side_menu.events
  'click #profile-button': (e, t) ->
    Router.go 'profile'

  'click #friends-button': (e, t) ->
    Router.go 'friends'

  'click #logout-button': (e, t) ->
    Meteor.logout()