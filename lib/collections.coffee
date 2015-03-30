
if Meteor.isServer
  # publish for avatar
  Meteor.publish 'players', ->
    Meteor.users.find {"status.online": true},
      fields:
        "_id":1
        "profile":1
        "pos":1
        "rot":1
        "services.twitter.profile_image_url_https":1
        "services.facebook.id":1
        "services.google.picture":1
        "services.github.username":1
        "services.instagram.profile_picture":1


if Meteor.isClient
  @Subs =
    players: Meteor.subscribe 'players'

Meteor.users.allow update: -> true