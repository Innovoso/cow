Template.createEvent.rendered = ->
  $("#startDay").pickadate()
  $("#startTime").pickatime()
  $("#endDay").pickadate()
  $("#endTime").pickatime()

  if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent))
    Session.set('isMobile', true)

  else
    Session.set('isMobile', false)

Template.createEvent.events 'submit form#createEvent' : (event, template) ->
  event.preventDefault()

  title       = template.find "input[name=title]"
  location    = template.find "input[name=location]"
  startDay    = template.find "input[name=startDay]"
  startTime   = template.find "input[name=startTime]"
  endDay      = template.find "input[name=endDay]"
  endTime     = template.find "input[name=endTime]"
  notes       = template.find "input[name=notes]"

  startDateTime = new Date(startDay.value.concat(" ", startTime.value)).toUTCString()
  endDateTime   = new Date(endDay.value.concat(" ", endTime.value)).toUTCString()
  startDay      = new Date(startDay.value)

  data = {
    title            : title.value,
    location         : location.value,
    startDay         : startDay,
    startDateTime    : startDateTime,
    endDateTime      : endDateTime,
    notes            : notes.value
  }

  Events.insert data, (err) -> { "Error in saving Event" }
  Router.go 'eventsCalendar'

Template.createEventNav.events
  'click .back-button': (e) ->
    Router.go 'eventsCalendar'

Template.createEvent.isMobile = ->
  return Session.get('isMobile')






