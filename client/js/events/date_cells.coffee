Template.eventsNav.helpers
  title: =>
    moment(@calendarDate).format("MMM YY")

Template.dateCells.helpers

  datesArray: ->
    getCalendarArrayForMonthWithDate(calendarDate || new Date())

  id: ->
    "c" + moment(this).format("MDYY")

Template.dateCells.rendered = ->
  currentDay = "c" + moment(@currentDate).format("MDYY")

  if $('#' + currentDay)
    $('#' + currentDay).addClass('currentDate')

Template.dateCells.events
  'click .dateCell': (e) ->
    if e.target.id != "c" + moment(@currentDate).format("MDYY")
      $('.dateCell').removeClass('selectedDate')
      $(e.target).addClass('selectedDate')

Template.eventsNav.events
  'click .plus-button': (e) ->
    Router.go 'createEvent'

Template.createEvent.events
  'click #invitees': (e) ->
    Router.go 'friends'
