Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'login', { path: '/' }
  @route 'chat'
  @route 'friends'
  @route 'event', { path: '/events' }

  @route 'register'
  @route 'reset_password'

autoLogin = (pause) ->
  Router.go 'chat' if Meteor.userId()

requireLogin = (pause) ->
  Router.go 'login' unless Meteor.userId()

Router.onBeforeAction requireLogin,
  except: ['login', 'register', 'reset_password']

Router.onBeforeAction autoLogin,
  only: ['login', 'register']

