UI.registerHelper 'vote_count', (votes = []) ->
  votes.length

Template.polls.helpers
  allPolls: -> Polls.find()

Template.polls.events
  'click .back-button': (e, t) ->
    e.preventDefault()
    Router.go '/chat/' + Router.current().params._id
    false
