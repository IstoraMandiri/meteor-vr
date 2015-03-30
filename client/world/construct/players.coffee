W.populatePlayers = ->

  Meteor.users.find().observeChanges

    added: (id, doc) -> # create the mesh
      console.log 'hi', id, doc
      if Meteor.userId() isnt id
        material = new THREE.MeshPhongMaterial()
        geometry = new THREE.BoxGeometry(1,1,1)
        mesh = new THREE.Mesh(geometry, material)
        W.players[id] = {mesh: mesh, rot:doc.rot, pos:doc.pos, born:false}

    removed: (id) -> # destroy the mesh
      console.log 'bye', id
      if W.players[id]
        W.players[id].dead = true

    changed: (id, fields) -> # move the mesh
      # for field in doc.update
      console.log 'move', id, fields
      player = W.players[id]
      console.log 'player', player
      if player
        if fields.pos
          player.pos = fields.pos
        if fields.rot
          player.rot = fields.rot