W.initContainer = (element) ->
  W.renderer = new THREE.WebGLRenderer
  W.element = W.renderer.domElement
  W.container = element
  W.container.appendChild W.element
  window.addEventListener 'resize', resize, false
  setTimeout resize, 1
  $(document).click ->
    if App.helpers.isMobile() and !App.helpers.isIos()
      launchIntoFullscreen document.documentElement
      lockOrientation 'landscape-primary'


launchIntoFullscreen = (element) ->
  if element.requestFullscreen
    element.requestFullscreen()
  else if element.mozRequestFullScreen
    element.mozRequestFullScreen()
  else if element.webkitRequestFullscreen
    element.webkitRequestFullscreen()
  else if element.msRequestFullscreen
    element.msRequestFullscreen()

lockOrientation = (orientation) ->
  if window.screen.lockOrientation
    window.screen.lockOrientation(orientation)
  else if window.screen.mozLockOrientation
    window.screen.mozLockOrientation(orientation)
  else if window.screen.orientation.lock
    window.screen.orientation.lock(orientation)
  else if window.screen.msLockOrientation
    window.screen.msLockOrientation(orientation)

resize = ->
  width = W.container.offsetWidth
  height = W.container.offsetHeight
  W.camera.aspect = width / height
  W.camera.updateProjectionMatrix()
  W.renderer.setSize width, height
  W.effect.setSize width, height