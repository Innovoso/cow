isValidPassword = (password) ->
  password.length >= 4

Template.register.events

  'submit #register': (e, t) ->
    e.preventDefault()
    clearAccountsErrors()

    email = t.find('#account-email').value
    password = t.find('#account-password').value

    if isValidPassword(password)
      Accounts.createUser { email: email, password: password }, (error) ->
        if error
          throwAccountsError("Opps. Your account was not created.")
        else
          Router.go('event')

    false
