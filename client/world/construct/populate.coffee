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

  W.players = {}
  for playerId in ['presenter', '1', '2']
    if W.thisPlayer is playerId
      # attach webcam video feed view to camera
      # CAMERA
      W.getWebcam (webcam) ->
        # console.log 'adidng', webcam
        W.webcam = webcam
        W.camera.add W.webcam.mesh
        W.webcam.mesh.position.set 0,0, -6
    else
      # dont render own mesh
      material = new THREE.MeshPhongMaterial()
      geometry = new THREE.BoxGeometry(1,1,1)
      mesh = new THREE.Mesh(geometry, material)
      W.scene.add mesh
      W.players[playerId] = {mesh: mesh}


  # add car
  W.meshes.car {x: 100, y: 0}

