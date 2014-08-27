Template.vote_new.events
  'click .back-button': (e, t) ->
    e.preventDefault()
    id = Router.current().params._id
    Router.go('/chat/' + id)
    false

