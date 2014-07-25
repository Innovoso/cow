UI.registerHelper('json', (context) ->
  JSON.stringify(context)
)

Template.friends.helpers
  friends: ->
    friends = Meteor.users.find()
    # console.log friends.fetch()[0]
    # friends.fetch()