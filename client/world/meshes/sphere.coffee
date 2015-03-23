W.meshes.sphere = (options) ->

  material = new THREE.MeshPhongMaterial
    shading: THREE.SmoothShading
    blending: THREE.AdditiveBlending
    shininess: 5
    vertexColors: false

  geometry = new THREE.SphereGeometry(10, 32, 32)
  mesh = new THREE.Mesh(geometry, material)

  if options.x?
    mesh.position.x = options.x

  if options.y?
    mesh.position.y = options.y


  W.scene.add mesh