@Messages = new Meteor.Collection('messages')

Messages.allow
  insert: (userId, doc) -> !!userId
  update: -> false
  remove: -> true