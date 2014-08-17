setUserName = (name) ->
  Meteor.users.update(Meteor.userId(), { $set: { profile: { name: name }}})

Template.profile.helpers
  name: ->
    user = Meteor.user()
    user.profile.name if user.profile

Template.profile.rendered = ->

  Dropzone.autoDiscover = false
  $('#profile-pic').dropzone
    maxFiles: 1
    accept: (file, done) ->
      FS.Utility.eachFile event, (file) ->
        Images.insert file, (error, fileObj) ->
          if error
            console.log error
            done(error)
          else
            Meteor.users.update Meteor.userId(),
              $set: { 'profile.imageId': fileObj._id }

Template.profile.events
  'keyup #accounts-name': (e, t) ->
    setUserName(e.target.value)