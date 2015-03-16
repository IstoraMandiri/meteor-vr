clock = new THREE.Clock

lastUpdate = {}

updatePos = ->
  # TODO Potential optiomization
  # make this send only the diff; position might not change
  Cols.players.update 'presenter',
    $set:
      rot: [
        W.camera.rotation.x,
        W.camera.rotation.y,
        W.camera.rotation.z,
        W.camera.rotation.order
      ]

W.render = (t) ->
  # update world

  if W.isPresenter
    # user input
    W.controls.update clock.getDelta()
    # send camera position to meteor if presenter
    updatePos()
    # update camera

  else
    # set the camera position to that of the presenter
    pres = Cols.players.findOne 'presenter'
    if pres
      W.camera.rotation.set pres.rot[0], pres.rot[1], pres.rot[2], pres.rot[3]

  # apply vr stuffs
  if W.isVr
    W.camera.updateProjectionMatrix()

  # render world
  W.effect.render W.scene, W.camera
  # tick
  requestAnimationFrame W.render

