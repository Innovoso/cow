UI.registerHelper 'vote_count', (votes = []) ->
  votes.length

Template.polls.helpers
  allPolls: -> Polls.find()

Template.polls.events
  'click .back-button': (e, t) ->
    e.preventDefault()
    Router.go '/chat/' + Router.current().params._id
    false

  'click .vote-button': (e, t) ->
    e.preventDefault()
    target = $(e.currentTarget)
    parent = target.parents('.poll')

    index = parent.find('.vote-button').index(e.currentTarget)
    pollId = parent.data('id')

    Meteor.call 'upVote', pollId, index, Meteor.userId()
    false
