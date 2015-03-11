W.meshes.plane = ->

  material = new THREE.MeshPhongMaterial
    color: 0xffffff
    specular: 0xffffff
    shininess: 20
    shading: THREE.FlatShading
    map: W.textures.checkerBoard()

  geometry = new THREE.PlaneGeometry 1000, 1000
  mesh = new THREE.Mesh geometry, material
  mesh.rotation.x = -Math.PI / 2

  return mesh
