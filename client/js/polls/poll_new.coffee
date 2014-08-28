TabKey = 9
EnterKey = 13
UpKey = 38
DownKey = 40
LeftKey = 37
RightKey = 39

getNextInput = (current) ->
  $(':input:eq(' + ($(':input').index(current) + 1) + ')')[0]

getPrevInput = (current) ->
  $(':input:eq(' + ($(':input').index(current) - 1) + ')')[0]

addInput = ->
  input = "<input type='text' name='choices[][title]' placeholder='Option'>"
  tag = "<div class='input indent-1'>#{input}</div>"
  $('form').append(tag)

selectInput = (input) ->
  input.focus()

isRoot = (target) ->
  $(target).data('type') == 'root'

Template.poll_new.helpers
  chat_id: -> Router.current().params._id

Template.poll_new.events
  'click .back-button': (e, t) ->
    e.preventDefault()
    Router.go '/chat/' + Router.current().params._id
    false

  'click .send': (e, t) ->
    e.preventDefault()
    poll = $('form').serializeObject()
    console.log poll
    Polls.insert poll, (error) ->
      if error
        console.log "Poll insert error: "
        console.log error
      else
        Router.go '/polls/' + Router.current().params._id

    false

  'keydown input[type=text]': (e, t) ->

    target = e.currentTarget

    switch e.which

      when EnterKey, DownKey
        next = getNextInput(target)
        if next
          next.focus()
        else
          addInput()
          getNextInput(target).focus()

      when UpKey
        unless $(target).data('type') == 'root'
          getPrevInput(target).focus()

      when TabKey
        e.preventDefault()
        unless isRoot(target)
          alert 'indent'


