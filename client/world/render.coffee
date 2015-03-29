clock = new THREE.Clock

lastUpdate = {}

playerId =

updatePos = ->
  # TODO Potential optiomization
  # make this send only the diff; position might not change
  Cols.players.update W.thisPlayer,
    $set:
      rot: [
        W.camera.rotation.x
        W.camera.rotation.y
        W.camera.rotation.z
        W.camera.rotation.order
      ]
      ,
      pos: [
        W.camera.position.x
        W.camera.position.y
        W.camera.position.z
      ]

kMov = [0,0]

$(document).on 'keydown', (e) ->
  console.log e.keyCode

  if e.keyCode is 65
    kMov[0]=1
  else if e.keyCode is 68
    kMov[1]=1

$(document).on 'keyup', (e) ->
  if e.keyCode is 65
    kMov[0]=0
  else if e.keyCode is 68
    kMov[1]=0


first = true
W.render = (t) ->
  # update world

  # update models
  for id, val of W.players
    # move the square
    thisPos = Cols.players.findOne id
    W.players[id].mesh.rotation.set thisPos.rot[0], thisPos.rot[1], thisPos.rot[2], thisPos.rot[3]
    W.players[id].mesh.position.set thisPos.pos[0], thisPos.pos[1], thisPos.pos[2]

    # always move the flashlight

  # update webcam
  if W.webcam? and W.webcam.video.readyState is W.webcam.video.HAVE_ENOUGH_DATA
    W.webcam.videoImageContext.drawImage( W.webcam.video, 0, 0, W.webcam.videoImage.width, W.webcam.videoImage.height )
    if ( W.webcam.videoTexture )
      W.webcam.videoTexture.needsUpdate = true


  # user input
  if W.thisPlayer
    # set the position if it's the first time
    if first
      first = false
      pres = Cols.players.findOne W.thisPlayer
      if pres
        W.camera.position.set pres.pos[0], pres.pos[1], pres.pos[2]

    # user input
    if pad = navigator.getGamepads()[0]
      # gamepad
      W.camera.translateX pad.axes[0]
      W.camera.translateZ pad.axes[1]
      W.camera.translateY pad.buttons[0].value*-1 + pad.buttons[1].value

      # show/hide webcam overlay
      if W.webcam
        W.webcam.mesh.visible = pad.buttons[3].pressed

    else
      # keyboard
      # console.log 'moving', kMov
      W.camera.translateX kMov[0]*-1 + kMov[1]


    # send camera position to meteor if presenter
    # TODO move this somewhere more appropriate
    updatePos()

  else
    # set the camera position to that of the presenter
    pres = Cols.players.findOne 'presenter'
    if pres
      # if using vr, use the
      unless W.isVr
        W.camera.rotation.set pres.rot[0], pres.rot[1], pres.rot[2], pres.rot[3]

      W.camera.position.set pres.pos[0], pres.pos[1], pres.pos[2]

  # apply vr stuffs
  if W.isVr
    W.controls.update clock.getDelta()
    W.camera.updateProjectionMatrix()

  # render world
  W.effect.render W.scene, W.camera

  # tick
  requestAnimationFrame W.render

