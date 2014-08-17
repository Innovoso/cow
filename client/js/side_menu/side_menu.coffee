Template.side_menu.events
  'click #profile-button': (e, t) ->
    Router.go 'profile'

  'click #logout-button': (e, t) ->
    Meteor.logout()