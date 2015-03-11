
# Init the world
Template.world.rendered = ->

  # initialize dom
  W.initContainer @find('#world')

  # set the scene
  W.createScene()

  # add a camera
  W.addCamera()

  # add controller
  W.addUserInput()

  # populate scene
  W.populate()

  # kick off rendering
  W.render()