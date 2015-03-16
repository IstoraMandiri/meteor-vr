# client helpers

@App = @App || {}

App.helpers = {}

_.extend App.helpers,
  isMobile: -> /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)
  isIos : -> /iPhone|iPad|iPod/i.test(navigator.userAgent)
  getURLParameter : (name) -> return decodeURIComponent((new RegExp("[?|&]#{name}=([^&;]+?)(&|##|;|$)").exec(location.search) || [null,""] )[1].replace(/\+/g, '%20'))||null;