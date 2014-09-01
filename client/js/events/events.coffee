Template.events_list.events
  'click .event': (e, t) ->
    eventId = $(e.currentTarget).data('event-id')
    Router.go '/chat/' + eventId

