Template.register.events

  'submit #register-form': (e, t) ->
    e.preventDefault()

    email = t.find('#account-email').value
    password = t.find('#account-password').value

    if isValidPassword(password)
      Accounts.createUser { email: email, password: password }, (error) ->
        if error
          console.log "Accounts creation failed"
        else
          console.log "Success. Logged in as:"
          console.log Meteor.user()

          Router.go('event')

    false
