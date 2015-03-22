# W.meshes.car = (options) ->

#   material = new THREE.MeshPhongMaterial
#     shading: THREE.SmoothShading
#     blending: THREE.AdditiveBlending
#     ambient: 0x000000
#     specular: 0xffffff
#     shininess: 5
#     vertexColors: false

#   geometry = new THREE.SphereGeometry(10, 32, 32)
#   mesh = new THREE.Mesh geometry, material

#   if options.x?
#     mesh.position.x = options.x

#   if options.y?
#     mesh.position.y = options.y


#   # return mesh
#   mesh = undefined

#   loader = new THREE.JSONLoader()

#   loader.load '/js/threejs/models/car.js', (geometry, materials) ->
#     material = new THREE.MeshLambertMaterial
#       map: THREE.ImageUtils.loadTexture('/js/threejs/models/textures/gtare.jpg'),
#       colorAmbient: [0.480000026226044, 0.480000026226044, 0.480000026226044],
#       colorDiffuse: [0.480000026226044, 0.480000026226044, 0.480000026226044],
#       colorSpecular: [0.8999999761581421, 0.8999999761581421, 0.8999999761581421]

#     mesh = new THREE.Mesh geometry, material

#     mesh.receiveShadow = true
#     mesh.castShadow = true
#     mesh.rotation.y = -Math.PI/5

#     scene.add(mesh)
#     render()

#   return mesh
