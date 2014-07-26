Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'login', { path: '/' }
  @route 'chat', { }
  @route 'friends'
  @route 'event', { path: '/events' }

  @route 'register'
  @route 'reset_password'