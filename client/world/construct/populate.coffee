W.populate = ->
  # add light
  W.ambientLight = new THREE.DirectionalLight 0xffffff, 0.5
  W.ambientLight.position.set 0, 1, 0
  # W.light = new THREE.PointLight 0xffffff, 1, 120
  # W.light.position.set(0,50,0)
  # pLight = new THREE.PointLight 0xffffff, 0.1, 0
  # pLight.position.set 0, 200, 0
  W.scene.add W.ambientLight

  # flashlight = new THREE.SpotLight 0xffffff, 1, 500
  # W.camera.add flashlight
  # flashlight.position.set 0,0,1
  # flashlight.target = W.camera


  # add plane
  W.meshes.plane()

  # add ball
  # W.meshes.sphere {x: 20, y: 10}

  # add car
  W.meshes.car {x: 100, y: 0}

