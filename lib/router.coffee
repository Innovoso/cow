Router.configure
  layoutTemplate: 'layout'

Router.map ->

  @route 'login',
    path: '/'
    layoutTemplate: 'accounts_layout'

  @route 'register',
    layoutTemplate: 'accounts_layout'

  @route 'chat',
    waitOn: -> Meteor.subscribe 'messages'

  @route 'friends'

  @route 'event',
    path: '/events'

  @route 'reset_password'

  @route 'eventsCalendar',
    waitOn: () -> return Meteor.subscribe "events"

  @route 'createEvent'

autoLogin = (pause) ->
  console.log "autoLogin"
  Router.go 'eventsCalendar' if Meteor.userId()

requireLogin = (pause) ->
  Router.go 'login' unless Meteor.userId()

Router.onBeforeAction requireLogin,
  except: ['login', 'register', 'reset_password']

Router.onBeforeAction autoLogin,
  only: ['login', 'register']
