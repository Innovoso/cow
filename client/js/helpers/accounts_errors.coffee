@AccountsErrors = new Meteor.Collection null

@throwAccountsError = (message) ->
  AccountsErrors.insert { message: message, seen: false }

@clearAccountsErrors = ->
  console.log "lala"
  AccountsErrors.remove { seen: true }

clearAccountError = (errorId) ->
  AccountsErrors.remove(errorId)

Template.accounts_errors.helpers
  accounts_errors: -> AccountsErrors.find()

Template.accounts_errors.events
  'click .close': (e, t) ->
    clearAccountError($(e.target).data('id'))
