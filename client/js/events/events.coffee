Template.eventsList.events
  'click .event': (e, t) ->
    id = this._id
    Router.go '/chat/' + id