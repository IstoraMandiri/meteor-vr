resize = ->
  width = W.container.offsetWidth
  height = W.container.offsetHeight
  W.camera.aspect = width / height
  W.camera.updateProjectionMatrix()
  W.renderer.setSize width, height
  W.effect.setSize width, height


setOrientationControls = (e) ->
  if !e.alpha
    return
  W.controls = new THREE.DeviceOrientationControls W.camera, true
  W.controls.connect()
  W.controls.update()
  window.removeEventListener 'deviceorientation', setOrientationControls, true

init = ->

  W.renderer = new THREE.WebGLRenderer
  W.element = W.renderer.domElement
  W.container = document.getElementById('example')
  W.container.appendChild W.element

  #  POENTIAL OPTIMISATION FOR NOTE 4 + RITECH 3D
  # this.separation = 3;
  # this.focalLength = 39;
  W.effect = new THREE.StereoEffect W.renderer
  W.scene = new THREE.Scene

  # add W.camera
  W.camera = new THREE.PerspectiveCamera 90, 1, 0.001, 700
  W.camera.position.set 0, 10, 0
  W.scene.add W.camera

  # add controller
  W.controls = new THREE.OrbitControls(W.camera, W.element)
  W.controls.rotateUp Math.PI / 4
  W.controls.target.set W.camera.position.x + 0.1, W.camera.position.y, W.camera.position.z
  W.controls.noZoom = true
  W.controls.noPan = true

  window.addEventListener 'deviceorientation', setOrientationControls, true

  # add light
  light = new THREE.HemisphereLight 0x777777, 0x000000, 0.6
  W.scene.add light

  # add plane
  texture = THREE.ImageUtils.loadTexture('textures/patterns/checker.png')
  texture.wrapS = THREE.RepeatWrapping
  texture.wrapT = THREE.RepeatWrapping
  texture.repeat = new THREE.Vector2 50, 50
  texture.anisotropy = W.renderer.getMaxAnisotropy()

  material = new THREE.MeshPhongMaterial
    color: 0xffffff
    specular: 0xffffff
    shininess: 20
    shading: THREE.FlatShading
    map: texture

  geometry = new THREE.PlaneGeometry 1000, 1000
  mesh = new THREE.Mesh geometry, material
  mesh.rotation.x = -Math.PI / 2
  W.scene.add mesh

  # add ball
  material = new THREE.MeshPhongMaterial
    shading: THREE.SmoothShading
    blending: THREE.AdditiveBlending
    ambient: 0x000000
    specular: 0xffffff
    shininess: 5
    vertexColors: false

  geometry = new THREE.SphereGeometry(10, 32, 32)
  mesh = new THREE.Mesh(geometry, material)
  mesh.position.x = 20
  mesh.position.y = 10
  W.scene.add mesh
  window.addEventListener 'resize', resize, false
  setTimeout resize, 1

# exports
@W.init = init
