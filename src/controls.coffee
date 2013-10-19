define [], () ->
  class Controls extends Backbone.View
    initialize: ->
      console.log "Loading controls"

    render: ->
      console.log "rendering!"
      @