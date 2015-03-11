W.addCamera = ->
  # define camera
  W.camera = new THREE.PerspectiveCamera 90, 1, 0.001, 700
  W.camera.position.set 0, 10, 0
  W.scene.add W.camera