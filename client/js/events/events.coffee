Template.eventsList.events
  'click .event': (e, t) ->
    eventId = $(e.currentTarget).data('event-id')
    Router.go '/chat/' + eventId