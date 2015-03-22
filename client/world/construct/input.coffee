W.usingVR = App.helpers.getURLParameter('vr')?

W.addUserInput = ->
  # W.controls = new THREE.OrbitControls(W.camera, W.element)
  # W.controls.rotateUp Math.PI / 4
  # W.controls.target.set W.camera.position.x + 0.1, W.camera.position.y, W.camera.position.z
  # W.controls.noZoom = true
  # W.controls.noPan = true
  W.controls = new THREE.FirstPersonControls(W.camera)
  W.controls.movementSpeed = 10

  # if VR is supported, use DOC instead
  window.addEventListener 'deviceorientation', setOrientationControls, true
  # alwau WASD


setOrientationControls = (e) ->
  if !e.alpha
    return

  W.controls = new THREE.DeviceOrientationControls W.camera, true
  W.controls.connect()
  W.controls.update()
  window.removeEventListener 'deviceorientation', setOrientationControls, true