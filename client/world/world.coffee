# Init the world
Template.world.rendered = ->
  handle = @autorun =>
    if Subs.players.ready()
      # wait for subs until rendered
      W.init @find('#world')
      handle.stop()
