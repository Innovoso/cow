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
