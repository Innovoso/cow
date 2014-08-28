Template.poll.rendered = ->
  $(@firstNode).swipe
    swipeLeft: (e) ->
      console.log "lala"

Template.poll.events
  'click .vote-button:not(.voted)': (e, t) ->
    e.preventDefault()

    poll   = $(t.firstNode)
    pollId = poll.data('id')
    index  = poll.find('.vote-button').index(e.currentTarget)

    Meteor.call 'vote', pollId, index, Meteor.userId()

    false

  'click .vote-button.voted': (e, t) ->
    e.preventDefault()

    poll   = $(t.firstNode)
    pollId = poll.data('id')
    index  = poll.find('.vote-button').index(e.currentTarget)

    Meteor.call 'unvote', pollId, index, Meteor.userId()

    false

Template.poll.helpers
  voted: (votes) -> _.indexOf(votes, Meteor.userId()) != -1
