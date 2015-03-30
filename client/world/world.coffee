# Init the world
Template.world.rendered = ->
  $world = @find('#world')
  first = true
  @autorun ->
    if first and Subs.players.ready()
      first = false
      # wait for subs until rendered
      W.init $world
