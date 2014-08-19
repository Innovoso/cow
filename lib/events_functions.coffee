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
      startDateTime:   obj.startDateTime,
      endDateTime:     obj.endDateTime,
      _id:             obj._id
    }
    tempData.push(event)


  console.log startDate
  console.log endDate

  startYear   = startDate.getFullYear()
  startMonth  = startDate.getMonth()+1
  startDay    = startDate.getDate()

  console.log startYear



  startDate = moment(startYear+"-"+startMonth+"-"+startDay)


  # endYear   = startDate.getFullYear()
  # endMonth  = startDate.getMonth()+1
  # endDay    = startDate.getDate()


  # endDate = moment(endYear+"-"+endMonth+"-"+endDay)

  # console.log startDate
  # console.log endDate

  # console.log startDate
  # console.log startDate.isValid()



  # startDate = moment(startDate, 'ddd MMM DD YYYY HH:mm:ss')
  # startDate = moment()


  startOfMonth = getStartOfMonth(startDate)
  daysFromPreviousMonth = startOfMonth.getDay()
  startDate = deltaDays(getStartOfMonth(startDate), -daysFromPreviousMonth)

  endOfMonth = getEndOfMonth(endDate)
  daysFromNextMonth = 42 - moment(endDate).daysInMonth()
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