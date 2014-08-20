Meteor.publish 'friends', (emails = []) ->
  Meteor.users.find
    emails:
      $elemMatch:
        address:
          $in: emails

Meteor.publish 'friendsSearch', (email) ->
  Meteor.users.find
    emails:
      $elemMatch:
        address: email
