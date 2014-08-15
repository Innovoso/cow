Template.side_menu.events
  'click #profile-button': (e, t) ->
    alert "profile button"

  'click #logout-button': (e, t) ->
    Meteor.logout()