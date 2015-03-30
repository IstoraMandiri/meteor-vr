clock = new THREE.Clock

updateMeteor = _.throttle ->
  # TODO Potential optiomization
  # make this send only the diff; position might not change
  # console.log 'updating', Meteor.userId()
  update = {}
  update['pos'] = [
    W.camera.position.x
    W.camera.position.y
    W.camera.position.z
  ]
  update['rot'] = [
    W.camera.rotation.x
    W.camera.rotation.y
    W.camera.rotation.z
    W.camera.rotation.order
  ]

  Meteor.users.update Meteor.userId(), $set: update

, 100

kMov = [[0,0],[0,0]]

$(document).on 'keydown', (e) ->
  if e.keyCode is 65
    kMov[0][0]=1
  else if e.keyCode is 68
    kMov[0][1]=1
  else if e.keyCode is 87
    kMov[1][0]=1
  else if e.keyCode is 83
    kMov[1][1]=1

$(document).on 'keyup', (e) ->
  if e.keyCode is 65
    kMov[0][0]=0
  else if e.keyCode is 68
    kMov[0][1]=0
  else if e.keyCode is 87
    kMov[1][0]=0
  else if e.keyCode is 83
    kMov[1][1]=0


first = true
W.render = (t) ->
  # update world

  # user input
  if W.thisPlayer
    # set the position if it's the first time
    if first
      first = false
      pres = Meteor.user()
      if pres and pres.pos
        W.camera.position.set pres.pos[0]||0, pres.pos[1]||0, pres.pos[2]||0
      else
        W.camera.position.set 0, 0, 0

      console.log 'set initial camera', JSON.stringify W.camera.position

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
      # TODO more keyboard
      W.camera.translateX kMov[0][0]*-1 + kMov[0][1]
      W.camera.translateZ kMov[1][0]*-1 + kMov[1][1]

    updateMeteor()


  # TODO MOVE THIS

  # # update models
  for key, player of W.players
    console.log key
    unless player.born
      player.born = true
      W.scene.add player.mesh
    if player.dead
      W.scene.remove player.mesh
      delete W.players[key]
    else
      player.mesh.rotation.set player.rot[0], player.rot[1], player.rot[2], player.rot[3]
      player.mesh.position.set player.pos[0], player.pos[1], player.pos[2]



  # TODO MOVE THIS

  # if !W.isPlayer
  #   # set the camera position to that of the presenter
  #   pres = Meteor.users.findOne W.thisPlayer
  #   if pres
  #     # if using vr, use the
  #     unless W.isVr
  #       W.camera.rotation.set pres.rot[0], pres.rot[1], pres.rot[2], pres.rot[3]

  #     W.camera.position.set pres.pos[0], pres.pos[1], pres.pos[2]

  # apply vr stuffs
  if W.isVr
    W.controls.update clock.getDelta()
    W.camera.updateProjectionMatrix()

    # update webcam
    if W.webcam?.video?.readyState is W.webcam.video.HAVE_ENOUGH_DATA
      W.webcam.videoImageContext.drawImage( W.webcam.video, 0, 0, W.webcam.videoImage.width, W.webcam.videoImage.height )
      if ( W.webcam.videoTexture )
        W.webcam.videoTexture.needsUpdate = true

  # render world
  W.effect.render W.scene, W.camera

  # tick
  requestAnimationFrame W.render

