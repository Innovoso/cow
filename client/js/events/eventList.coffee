Template.eventsCalendar.event = ->
  tempData = []
  data = []
  calendarDate = moment(Session.get 'calendarDate').format('MMYY')

  Events.find().forEach (obj) ->
    event = {
      title:           obj.title,
      location:        obj.location,
      startDateTime:   obj.startDateTime
      endDateTime:     obj.endDateTime,
    }
    tempData.push(event)

  for e in tempData
    if moment(e.startDateTime).format('MMYY') == calendarDate
      data.push(e)
  data

