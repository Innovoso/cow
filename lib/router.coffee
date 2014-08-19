Router.configure
  layoutTemplate: 'layout'

Router.map ->

  @route 'login',
    path: '/'
    layoutTemplate: 'accounts_layout'

  @route 'register',
    layoutTemplate: 'accounts_layout'

  # @route 'chat',
  #   waitOn: -> Meteor.subscribe 'messages'

  @route 'friends'

  @route 'event',
    path: '/events'

  @route 'login', { path: '/' }

  @route 'chat', {
    path: '/chat/:_id',
    waitOn: ->
      Meteor.subscribe 'messages'
      # console.log this.params

    # onBeforeAction: =>
    #   url = window.location.pathname
    #   id = url.substring(url.lastIndexOf('/') + 1)

    #   eventId = id
    #   chatId = "chat-" + eventId
    #   @Messages = new Meteor.Collection(chatId)
    #   console.log @Messages

    #   if Meteor.isServer
    #     Meteor.publish chatId, () ->
    #       return @Messages.find()

    #   if Meteor.isClient
    #     Meteor.subscribe chatId

      # Messages.remove(Messages.insert { temp: "temp" })
  }

  @route 'friends'
  # @route 'event', { path: '/events' }
  @route 'register'

  @route 'reset_password'

  @route 'eventsCalendar',
    waitOn: () -> return Meteor.subscribe "events"

  @route 'createEvent'

  @route 'profile'

autoLogin = (pause) ->
  Router.go 'eventsCalendar' if Meteor.userId()

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
