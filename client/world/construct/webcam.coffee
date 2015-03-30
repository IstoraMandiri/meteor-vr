
W.getWebcam = (callback) ->

  $monitor = $('<video id="monitor" autoplay width="640" height="480" style="visibility: hidden; float:left;"></video>')
  $videoImage = $('<canvas id="videoImage" width="640" height="480" style="visibility: hidden; float:left;"></canvas>')
  $('body').append($monitor).append($videoImage)
  camvideo = $monitor[0]

  initTexture = ->

    videoImage = $videoImage[0]
    videoImageContext = videoImage.getContext( '2d' );
    # // background color if no video present
    videoImageContext.fillStyle = '#000000';
    videoImageContext.fillRect( 0, 0, videoImage.width, videoImage.height );

    videoTexture = new THREE.Texture( videoImage );
    videoTexture.minFilter = THREE.LinearFilter;
    videoTexture.magFilter = THREE.LinearFilter;

    movieMaterial = new THREE.MeshBasicMaterial( { map: videoTexture, overdraw: true, side:THREE.DoubleSide } );
    # // the geometry on which the movie will be displayed;
    # //    movie image will be scaled to fit these dimensions.
    movieGeometry = new THREE.PlaneGeometry( 8, 6, 1, 1 );
    movieScreen = new THREE.Mesh( movieGeometry, movieMaterial );
    # TODO maybe not invisible by default ?
    movieScreen.visible = false

    # exports
    callback
      mesh: movieScreen
      video: $monitor[0]
      videoImageContext: videoImageContext
      videoImage: videoImage
      videoTexture: videoTexture

  gotStream = (stream) ->
    if window.URL
      camvideo.src = window.URL.createObjectURL(stream)
    else
      camvideo.src = stream

    initTexture()

    camvideo.onerror = (e) -> stream?.stop()

    stream.onended = noStream

  noStream = (e) -> console.log e

  # getSources

  navigator.getUserMedia = navigator.getUserMedia or navigator.webkitGetUserMedia or navigator.mozGetUserMedia
  window.URL = window.URL or window.webkitURL

  if navigator.getUserMedia and MediaStreamTrack
    MediaStreamTrack.getSources (sources) ->
      bestCamera = undefined
      for source in sources
        if source.kind is 'video'
          bestCamera = source.id

      navigator.getUserMedia
        video:
          optional: [
            sourceId: bestCamera
          ]
      , gotStream, noStream

