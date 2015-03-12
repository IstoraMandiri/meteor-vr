W.init = (element) ->
  # initialize dom
  W.initContainer element

  # set the scene
  W.scene = new THREE.Scene
  W.effect = new THREE.StereoEffect W.renderer

  # add a camera
  W.addCamera()

  # add controller
  W.addUserInput()

  # populate scene
  W.populate()

  # kick off rendering
  W.render()