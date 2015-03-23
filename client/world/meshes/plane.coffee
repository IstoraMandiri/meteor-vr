W.meshes.plane = ->

  material = new THREE.MeshPhongMaterial
    map: W.textures.checkerBoard()

  geometry = new THREE.PlaneGeometry 1000, 1000
  mesh = new THREE.Mesh geometry, material
  mesh.rotation.x = -Math.PI / 2

  W.scene.add mesh
