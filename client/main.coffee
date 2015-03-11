@App = @App || {}

App.helpers?= {}
_.extend App.helpers,

  isMobile: -> /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)
  isIos : -> /iPhone|iPad|iPod/i.test(navigator.userAgent)
