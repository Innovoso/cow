@messagesRendered = 0

scrollTop = (element) ->
  $('html, body').animate({
    scrollTop: element.offset().top
  }, '50000', 'easeInOutCubic')

getUserName = ->
  user = Meteor.user()
  user.name || user.emails[0].address

getAndClearInput = (input_field) ->
  message = input_field.val()
  input_field.val('')
  message

createMessage = (userId, name, content) ->
  { userId: userId, name: name, message: content, time: Date.now() }

Template.chat.helpers
  messages: -> Messages.find({}, { sort: { time: 1 }})

Template.chat.events
  'submit form': (e) ->
    e.preventDefault()
    content = getAndClearInput($(e.target).find('[name=message]'))
    username = getUserName()
    userId = Meteor.userId()
    message = createMessage(userId, username, content)
    Messages.insert(message)
    false

Template.message.helpers
  me: (message) -> if Meteor.userId() == message.userId then 'me'

Template.message.rendered = ->
  messagesRendered += 1
  if messagesRendered == Messages.find().count()
    Meteor.defer ->
      lastMessage = $('.message:last-of-type')
      scrollTop(lastMessage)
      lastMessage
        .transition({ scale: 0.9, opacity: 1, duration: 0})
        .transition({ scale: 1.0, opacity: 1 }, 300, 'ease')
