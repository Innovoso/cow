Template.calendarDays.helpers

  date: ->
    # initialize
    date = new Date(2014, 1, 1)
    y = date.getFullYear()
    m = date.getMonth()
    endOfMonth = new Date(y,m + 1,0)
    startOfMonth = new Date(y,m,1)
    dateArray = []

    daysFromPreviousMonth = startOfMonth.getDay()
    numberOfDaysInPreviousMonth = new Date(y, m, 0)

    # Push days from previous months
    for days in [(numberOfDaysInPreviousMonth.getDate() - (daysFromPreviousMonth - 1))..numberOfDaysInPreviousMonth.getDate()]
      dateArray.push days

    # push days in current month
    for days in [1..endOfMonth.getDate()]
      dateArray.push days

    # Push days of next month
    daysFromNextMonth = 42 - dateArray.length
    if daysFromNextMonth != 0
      for days in [1..daysFromNextMonth]
        dateArray.push days

    # return Array
    return dateArray









