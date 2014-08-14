trimInput = (val) ->
  val.replace(/^\s*|\s*$/g, "")

isValidPassword = (val) ->
  if val.length >= 4 then true else false

Template.login.events

  'submit #login-form': (e, t) ->
    e.preventDefault()

    email = trimInput(t.find('#login-email').value)
    password = t.find('#login-password').value

    Meteor.loginWithPassword email, password, (error) ->
      if error
        console.log "User not found or password incorrect"
      else
        console.log "Logged in as:"
        console.log Meteor.user()

        Router.go('eventsCalendar')
    false
