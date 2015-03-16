# Collections
@Cols =
  players : new Mongo.Collection 'players'

# Global Exports
@W = # World
  meshes : {}
  textures : {}

if Meteor.isServer
  if Cols.players.find().count() is 0
    Cols.players.insert {_id: 'presenter'}