W.addUserInput = ->

  if W.isVr
    window.addEventListener 'deviceorientation', setOrientationControls, true
  else
    W.controls = new THREE.FirstPersonControls(W.camera)
    W.controls.movementSpeed = 10


setOrientationControls = (e) ->
  if !e.alpha
    return

  W.controls = new THREE.DeviceOrientationControls W.camera, true
  W.controls.connect()
  W.controls.update()
  window.removeEventListener 'deviceorientation', setOrientationControls, true