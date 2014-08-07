Template.eventsNav.helpers
  title: =>
    moment(Session.get 'calendarDate').format("MMM YY")

Template.dateCells.helpers

  datesArray: ->
    getCalendarArrayForMonthWithDate(Session.get 'calendarDate' || new Date())

Template.dateCell.helpers
  id_c: ->
    "c" + moment(this).format("MDYY")

  id_d: ->
    "d" + moment(this).format("MDYY")

Template.dateCells.rendered = ->
  # Add circle to current day
  currentDay = "c" + moment(Session.get 'currentDate').format("MDYY")
  if $('#' + currentDay)
    $('#' + currentDay).addClass('currentDate')

  Deps.autorun () ->
    events = Events.find().fetch()
    grouped = _.countBy(_.pluck(events, 'startDay'))

    for own key, value of grouped
      id = "d" + moment(key).format("MDYY")
      if value == 1
        $("##{id}").addClass('oneEvent')
      else if value == 2
        $("##{id}").addClass('twoEvents')
      else if value == 3 || value > 3
        $("##{id}").addClass('threeEvents')

Template.dateCells.events
  'click .dateCell': (e) ->

    date = getStartOfMonth(Session.get 'calendarDate')
    dateId = getSelectedDateId(date)
    # alert dateId
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
