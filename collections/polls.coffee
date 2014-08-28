@Polls = new Meteor.Collection 'polls'

Meteor.methods
  upVote: (pollId, index, userId) ->
    vote = {}
    vote["choices.#{index}.votes"] = userId
    Polls.update pollId, { $addToSet: vote }
