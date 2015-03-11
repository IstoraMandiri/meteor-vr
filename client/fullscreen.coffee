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


$(document).click ->
  if App.helpers.isMobile() and !App.helpers.isIos()
    launchIntoFullscreen document.documentElement
    lockOrientation 'landscape-primary'
