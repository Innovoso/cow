scrollTop = (element) ->
  $('.messages').animate {
    scrollTop: $('#messages')[0].scrollHeight
  }, '50000', 'easeInOutCubic'

getUserName = ->
  user = Meteor.user()
  name = user.profile.name if user.profile
  name || user.emails[0].address

getAndClearInput = (input_field) ->
  message = input_field.val()
  input_field.val('')
  message

createMessage = (userId, name, content) ->
  { userId: userId, name: name, message: content, time: Date.now() }

Template.chat.helpers
  messages: -> Messages.find({}, { sort: { time: 1 }})

Template.chat.events
  'submit form': (e, t) ->
    e.preventDefault()
    content = getAndClearInput($(t.find('#message')))
    if content.length > 0
      message = createMessage(Meteor.userId(), getUserName(), content)
      Messages.insert(message)
    false

Template.message.helpers
  me: (message) -> if Meteor.userId() == message.userId then 'me'

Template.message.rendered = ->
  messagesRendered += 1
  if messagesRendered == Messages.find().count()
    lastMessage = $('.message:last-of-type')
    scrollTop(lastMessage)
    lastMessage
      .transition { scale: 0.9, opacity: 1, duration: 0 }
      .transition { scale: 1.0, opacity: 1 }, 300, 'ease'
