Template.createEvent.rendered = ->
  $("#startDay").pickadate()
  $("#startTime").pickatime()
  $("#endDay").pickadate()
  $("#endTime").pickatime()

  if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent))
    Session.set('isMobile', true)

  else
    Session.set('isMobile', false)

Template.createEvent.events
  'submit form#createEvent' : (e, t) ->
    e.preventDefault()

    title       = t.find("input[name=title]").value
    location    = t.find("input[name=location]").value
    startDay    = t.find("input[name=startDay]").value
    startTime   = t.find("input[name=startTime]").value
    endDay      = t.find("input[name=endDay]").value
    endTime     = t.find("input[name=endTime]").value
    notes       = t.find("input[name=notes]").value

    startDateTime = new Date(startDay.concat(" ", startTime)).toUTCString()
    endDateTime   = new Date(endDay.concat(" ", endTime)).toUTCString()
    startDay      = new Date(startDay)

    event =
      title            : title
      location         : location
      startDay         : startDay
      startDateTime    : startDateTime
      endDateTime      : endDateTime
      notes            : notes

    Events.insert event, (err) -> console.log "Error in saving Event"
    Router.go 'events'


Template.createEventNav.events
  'click .back-button': (e) ->
    Router.go 'events'

Template.createEvent.isMobile = -> Session.get('isMobile')
