buildMessage = (name, content) ->
  { name: name, message: content, time: Date.now() }

Template.chat.helpers
  messages: -> Messages.find({}, { sort: { time: 1 }})

Template.chat.events

  'submit form': (e) ->
    e.preventDefault()

    if Meteor.user()
      input = $(e.target).find('[name=message]')
      content = input.val()
      input.val('')

      email = Meteor.user().emails[0].address
      message = buildMessage(email, content)

      Messages.insert(message)
