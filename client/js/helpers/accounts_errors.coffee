@AccountsErrors = new Meteor.Collection null

@throwAccountsError = (message) ->
  AccountsErrors.insert { message: message }

Template.accounts_errors.helpers
  accounts_errors: -> AccountsErrors.find()
