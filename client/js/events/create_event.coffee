Template.createEvent.rendered = ->
  $("#startDay").pickadate()
  $("#startTime").pickatime()
  $("#endDay").pickadate()
  $("#endTime").pickatime()


Template.createEvent.events 'submit form#createEvent' : (event, template) ->
  event.preventDefault()

  title       = template.find "input[name=title]"
  location    = template.find "input[name=location]"

  startDay    = template.find "input[name=startDay]"
  startTime   = template.find "input[name=startTime]"

  endDay      = template.find "input[name=endDay]"
  endTime     = template.find "input[name=endTime]"

  # friends
  notes       = template.find "input[name=notes]"

  console.log notes.value

  data = {

    title       : title.value,
    location    : location.value,

    startDay    : startDay.value,
    startTime   : startTime.value,

    endDay      : endDay.value,
    endTime     : endTime.value,

    notes       : notes.value
  }

  Events.insert data, (err) -> { "Error in saving Event" }
  Router.go 'eventsCalendar'

Template.createEventNav.events
  'click .back-button': (e) ->
    Router.go 'eventsCalendar'
