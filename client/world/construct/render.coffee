clock = new THREE.Clock

W.render = (t) ->
  # update world
  W.controls.update clock.getDelta()
  W.camera.updateProjectionMatrix()
  # TODO send position to meteor
  # console.log 'W.camera', W.camera.position, W.camera.rotation
  # render world
  W.effect.render W.scene, W.camera
  # tick
  requestAnimationFrame W.render


