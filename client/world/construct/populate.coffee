W.populate = ->
  # add light
  W.ambientLight = new THREE.DirectionalLight 0xffffff, 0.5
  W.ambientLight.position.set 0, 1, 0
  # W.light = new THREE.PointLight 0xffffff, 1, 120
  # W.light.position.set(0,50,0)
  # pLight = new THREE.PointLight 0xffffff, 0.1, 0
  # pLight.position.set 0, 200, 0
  W.scene.add W.ambientLight

  # add plane
  # W.meshes.plane()

  # add ball
  # W.meshes.sphere {x: 20, y: 10}

  # add flashlight to this camera
  W.flashlight = new THREE.SpotLight 0xffffff, 1, 500
  W.camera.add W.flashlight
  W.flashlight.position.set 0,0,1
  W.flashlight.target = W.camera

  if W.isVr
    W.getWebcam (webcam) ->
      # console.log 'adidng', webcam
      W.webcam = webcam
      W.camera.add W.webcam.mesh
      W.webcam.mesh.position.set 0,0, -6


  # add players
  W.populatePlayers()

  # add car
  W.meshes.car {x: 100, y: 0}

