SlideRight = '80%'

Template.eventsNav.events
  'click .settings-button': (e, t) ->
    pane = $('#events_calendar')
    x = pane.css('x')
    x = if x == 0 || x == '0px' then SlideRight else 0
    pane.transition({ x: x })