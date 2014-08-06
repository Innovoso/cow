Template.eventsCalendar.event = ->
  data = []
  Events.find().forEach (obj) ->
    event = {
      title:           obj.title,
      location:        obj.location,
      startDateTime:   obj.startDateTime,
      endDateTime:     obj.endDateTime,
    }
    data.push(event)
  data



