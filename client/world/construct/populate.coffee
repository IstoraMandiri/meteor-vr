W.populate = ->
  # add light
  light = new THREE.HemisphereLight 0x777777, 0x000000, 0.6
  W.scene.add light

  W.scene.add W.meshes.plane()

  W.scene.add W.meshes.sphere {x: 20, y: 10}

