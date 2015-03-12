W.populate = ->
  # add light
  W.scene.add new THREE.HemisphereLight 0x777777, 0x000000, 0.6

  # add plane
  W.scene.add W.meshes.plane()

  # add ball
  W.scene.add W.meshes.sphere {x: 20, y: 10}

