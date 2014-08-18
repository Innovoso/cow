@getIdForCurrentDate = ->
  "c" + moment(Session.get 'currentDate').format("MDYY")

@getIdForEventDots = (date) ->
  "d" + moment(date).format("MDYY")

@getIdForSelectDate = (date) ->
  moment(date).format("MDYY")

@monthAndYear = (date) -> [date.getMonth(), date.getFullYear()]

@beginningOfDay = (date = new Date()) ->
  new Date(date.getFullYear(), date.getMonth(), date.getDate())

@getStartOfMonth = (date) ->
  [month, year] = monthAndYear(date)
  new Date(year, month, 1, 0, 0, 0, 0)

@getEndOfMonth = (date) ->
  [month, year] = monthAndYear(date)
  new Date(year, month + 1, 0, 0, 0, 0)

@deltaDays = (date, deltaDays) ->
  newDate = beginningOfDay(date)
  newDate.setDate(newDate.getDate() + deltaDays)
  newDate

@getCalendarArrayForMonthWithDate = (date) ->
  startOfMonth = getStartOfMonth(date)
  daysFromPreviousMonth = startOfMonth.getDay()
  startDate = deltaDays(getStartOfMonth(date), -daysFromPreviousMonth)
  dateArray = []
  for i in [0...42]
    dateArray.push deltaDays(startDate, i)
  dateArray

getCalendarVisibleStartDate = (date) ->
  startOfMonth = getStartOfMonth(date)
  deltaDays(startOfMonth, -startOfMonth.getDay())

getCalendarVisibleEndDate = (date) ->
  endOfMonth = getEndOfMonth(date)
  deltaDays(endOfMonth, endOfMonth.getDay()).setHours(23,59,59,999)

@getEventsList = (startDate, endDate) ->
  events = Events.find().fetch()

  startDate = getCalendarVisibleStartDate(startDate)
  endDate = getCalendarVisibleEndDate(endDate)

  events = _.filter events, (event) ->
    eventDate = moment.utc(event.startDateTime).toDate()
    startDate <= eventDate <= endDate

  eventsArray = []
  grouped = _.groupBy(events, 'startDay')
  for own key, value of grouped
    eventsArray.push({key,value})
  eventsArray
