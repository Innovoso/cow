Template.friends_nav.events
  'click .back-button': (e, t) ->
    Router.go '/'

  'click .plus-button': (e, t) ->
    Router.go '/friends/new'
