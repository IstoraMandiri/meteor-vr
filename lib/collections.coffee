# Collections
@Cols =
  players : new Mongo.Collection 'players'

if Meteor.isServer
  if Cols.players.find().count() is 0
    Cols.players.insert {_id: 'presenter'}
    Cols.players.insert {_id: '1'}
    Cols.players.insert {_id: '2'}

  Meteor.publish 'players', -> Cols.players.find()
  # publish for avatar
  Meteor.publish null, ->
    Meteor.users.find {},
      fields:
        "services.twitter.profile_image_url_https":1
        "services.facebook.id":1
        "services.google.picture":1
        "services.github.username":1
        "services.instagram.profile_picture":1

if Meteor.isClient
  @Subs =
    players: Meteor.subscribe 'players'