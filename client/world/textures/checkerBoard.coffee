W.textures.checkerBoard = ->

  texture = THREE.ImageUtils.loadTexture('textures/patterns/checker.png')
  texture.wrapS = THREE.RepeatWrapping
  texture.wrapT = THREE.RepeatWrapping
  texture.repeat = new THREE.Vector2 50, 50
  texture.anisotropy = W.renderer.getMaxAnisotropy()

  return texture