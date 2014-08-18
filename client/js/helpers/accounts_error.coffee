Template.accounts_error.rendered = ->
  accounts_error = this.data
  Meteor.defer ->
    AccountsErrors.update(accounts_error._id, { $set: { seen: true }})
