Template.eventsCalendar.event = ->
  startDate = Session.get 'calendarDate'
  endDate = getEndOfMonth(Session.get 'calendarDate')
  renderEventsList(startDate, endDate)

renderEventsList = (startDate, endDate) ->
  tempData = []
  data = []

  Events.find().forEach (obj) ->
    event = {
      title:           obj.title,
      location:        obj.location,
      startDateTime:   obj.startDateTime
      endDateTime:     obj.endDateTime,
    }
    tempData.push(event)

  for e in tempData
    if moment(startDate).isBefore(e.startDateTime) && moment(endDate).isAfter(e.startDateTime)
      data.push(e)
  data
