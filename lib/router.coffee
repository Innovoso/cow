Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'login', { path: '/' }
  @route 'chat', { }
  @route 'friends'
  @route 'eventsCalendar', { waitOn: () -> return Meteor.subscribe "events" }
  @route 'createEvent'
