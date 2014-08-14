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
  return dateArray

@getEventsList = (startDate, endDate) ->
  tempData = []
  data = []
  eventsArray = []

  Events.find().forEach (obj) ->
    event = {
      title:           obj.title,
      location:        obj.location,
      startDay:        obj.startDay,
      startDateTime:   obj.startDateTime
      endDateTime:     obj.endDateTime,
    }
    tempData.push(event)

  startOfMonth = getStartOfMonth(startDate)
  daysFromPreviousMonth = startOfMonth.getDay()
  startDate = deltaDays(getStartOfMonth(startDate), -daysFromPreviousMonth)

  endOfMonth = getEndOfMonth(endDate)
  daysFromNextMonth = endOfMonth.getDay()
  endDate = deltaDays(getEndOfMonth(endDate), daysFromNextMonth)
  endDate = endDate.setHours(23,59,59,999)

  for e in tempData
    eventDate = moment.utc(e.startDateTime).toDate()
    if startDate <= eventDate && eventDate <= endDate
      data.push(e)
  data = _.sortBy(data, 'startDay')

  grouped = _.groupBy(data, 'startDay')
  for own key, value of grouped
    eventsArray.push({key,value})
  eventsArray