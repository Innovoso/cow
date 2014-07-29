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


Template.createEvent.isMobile = ->
  return Session.get('isMobile')




# browser = {
#   Android: -> {
#       return navigator.userAgent.match(/Android/i)
#     },

#   BlackBerry: -> {
#       return navigator.userAgent.match(/BlackBerry/i)
#     },
#   iOS: -> {
#       return navigator.userAgent.match(/iPhone|iPad|iPod/i)
#     },
#   Opera: -> {
#       return navigator.userAgent.match(/Opera Mini/i)
#     },
#   Windows: -> {
#       return navigator.userAgent.match(/IEMobile/i)
#     },
#   any: -> {
#       return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
#   }
# };


# checkIfMobileBrowser = ->

#   if( isMobile.any() ) alert('Mobile');




