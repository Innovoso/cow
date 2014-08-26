Template.eventsNav.helpers
  title: =>
    moment(Session.get 'calendarDate').format("MMM YY")

Template.dateCells.helpers
  datesArray: ->
    getCalendarArrayForMonthWithDate(Session.get 'calendarDate' || new Date())

Template.dateCell.helpers
  id_currentDate: ->
    "c" + moment(this).format("MDYY")
  id_eventDots: ->
    "d" + moment(this).format("MDYY")
  id_selectDate: ->
    "s" + moment(this).format("MDYY")
  id_date: ->
    moment(this).format("MDYY")

Template.dateCells.rendered = ->
  addCurrentDayCircle()
  addEventDots()

Template.dateCells.events
  'click .dateCell': (e) ->
    removeFirstOfMonthSelectDate()
    addSelectDate(e)
    scrollToSelectedDate(e)
    false


Template.eventsNav.events
  'click .plus-button': (e) ->
    Router.go 'createEvent'

Template.createEvent.events
  'click #invitees': (e) ->
    Router.go 'friends'

addEventDots = ->
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

addCurrentDayCircle = ->
  currentDay = @getIdForCurrentDate()
  if $('#' + currentDay)
    $('#' + currentDay).addClass('currentDate')

removeFirstOfMonthSelectDate = ->
  date = getStartOfMonth(Session.get 'calendarDate')
  dateId = getIdForCurrentDate(date)
  $('#' + dateId).removeClass('selectedDate')

addSelectDate = (e) ->
  $('.dateCell').removeClass('selectedDate')
  $(e.currentTarget).addClass('selectedDate')
  false

scrollToSelectedDate = (e) ->
  id = 'h' + e.currentTarget.id
  element = $('#' + id)
  e.preventDefault()

  if element.length != 0 && element.position().top != 0
    $('.eventsList').animate(
      {scrollTop  : element.position().top + $('.eventsList').scrollTop() }, 500
    )


