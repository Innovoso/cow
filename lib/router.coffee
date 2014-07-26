Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'login', { path: '/' }
  @route 'chat', { }
  @route 'friends'
  @route 'eventsCalendar'
  @route 'createEvent'
