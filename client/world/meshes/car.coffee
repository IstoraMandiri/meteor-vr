W.meshes.car = (options) ->

  W.loader.load '/models/car.js', (geometry) ->

    material = new THREE.MeshPhongMaterial
      map: THREE.ImageUtils.loadTexture('/textures/skins/gtare.jpg')

    mesh = new THREE.Mesh geometry, material

    if options.x?
      mesh.position.x = options.x

    if options.y?
      mesh.position.y = options.y

    W.scene.add mesh


