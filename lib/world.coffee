# Collections
@Cols =
  players : new Mongo.Collection 'players'

if Meteor.isServer
  if Cols.players.find().count() is 0
    Cols.players.insert {_id: 'presenter'}
    Cols.players.insert {_id: '1'}
    Cols.players.insert {_id: '2'}

  Meteor.publish 'players', -> Cols.players.find()

if Meteor.isClient
  @Subs =
    players: Meteor.subscribe 'players'