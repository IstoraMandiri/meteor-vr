clock = new THREE.Clock

update = (dt) ->
  # resize()
  W.controls.update dt
  W.camera.updateProjectionMatrix()
  # TODO send position to meteor
  # console.log 'W.camera', W.camera.position, W.camera.rotation

render = (dt) ->
  W.effect.render W.scene, W.camera

animate = (t) ->
  requestAnimationFrame animate
  update clock.getDelta()
  render clock.getDelta()

# exports
@W.animate = animate