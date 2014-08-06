Template.eventsNav.helpers
  title: =>
    moment(@calendarDate).format("MMM YY")

Template.dateCells.helpers

  datesArray: ->
    getCalendarArrayForMonthWithDate(calendarDate || new Date())


Template.dateCell.helpers

  id_c: ->
    "c" + moment(this).format("MDYY")

  id_d: ->
    "d" + moment(this).format("MDYY")


Template.dateCells.rendered = ->
  # Add circle to current day
  currentDay = "c" + moment(@currentDate).format("MDYY")
  if $('#' + currentDay)
    $('#' + currentDay).addClass('currentDate')

  # Add dots to calendar representing number of events on day
  Deps.autorun () ->
    events = Events.find().fetch()
    grouped = _.countBy(_.pluck(events, 'startDay'))

    for own key, value of grouped
      id = "d" + moment(key).format("MDYY")
      if value == 1
        $("##{id}").addClass('oneEvent')
      else if value == 2
        $("##{id}").addClass('twoEvents')
      else if value == 3
        $("##{id}").addClass('threeEvents')

Template.dateCells.events
  'click .dateCell': (e) ->

    date = getStartOfMonth(calendarDate)
    dateId = getSelectedDateIdForDate(date)
    $('#' + dateId).removeClass('selectedDate')

    $('.dateCell').removeClass('selectedDate')
    $(e.currentTarget).addClass('selectedDate')
    false

Template.eventsNav.events
  'click .plus-button': (e) ->
    Router.go 'createEvent'

Template.createEvent.events
  'click #invitees': (e) ->
    Router.go 'friends'
