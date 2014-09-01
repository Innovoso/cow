@Polls = new Meteor.Collection 'polls'

Meteor.methods
  vote: (pollId, index, userId) ->
    vote = {}
    vote["choices.#{index}.votes"] = userId
    Polls.update pollId, { $addToSet: vote }

  unvote: (pollId, index, userId) ->
    vote = {}
    vote["choices.#{index}.votes"] = userId
    Polls.update pollId, { $pull: vote }
