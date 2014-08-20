Meteor.publish 'friends', (emails = []) ->
  Meteor.users.find
    emails:
      $elemMatch:
        address:
          $in: emails
