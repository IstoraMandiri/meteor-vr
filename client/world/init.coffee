W.init = (element) ->
  W.isPresenter = App.helpers.getURLParameter('p')
  W.isVr = App.helpers.isMobile() || App.helpers.getURLParameter('vr')?

  # initialize dom
  W.initContainer element

  # set the scene
  W.scene = new THREE.Scene

  # add effect
  if W.isVr
    W.effect = new THREE.StereoEffect W.renderer
  else
    W.effect = W.renderer

  # add a camera
  W.addCamera()

  # add controller
  if W.isPresenter or W.isVr
    W.addUserInput()

  # populate scene
  W.populate()

  # kick off rendering
  W.render()