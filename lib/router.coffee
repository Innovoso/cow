Router.configure
  layoutTemplate: 'layout'

Router.map ->

  @route 'login',
    path: '/'
    layoutTemplate: 'accounts_layout'

  @route 'register',
    layoutTemplate: 'accounts_layout'

  @route 'chat',
    path: '/chat/:_id'
    data: -> Events.findOne(this.params._id)
    waitOn: ->
      Meteor.subscribe 'messages', this.params._id

  @route 'friends'

  @route 'reset_password'

  @route 'events',
    waitOn: () -> return Meteor.subscribe "events"

  @route 'createEvent'

  @route 'profile'

autoLogin = (pause) ->
  Router.go 'events' if Meteor.userId()

requireLogin = (pause) ->
  Router.go 'login' unless Meteor.userId()

resetMessageRenderCount = (pause) =>
  @messagesRendered = 0

Router.onBeforeAction requireLogin,
  except: ['login', 'register', 'reset_password']

Router.onBeforeAction autoLogin,
  only: ['login', 'register']

Router.onBeforeAction -> clearAccountsErrors()

Router.onBeforeAction resetMessageRenderCount,
  only: ['chat']
