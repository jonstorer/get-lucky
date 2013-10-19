define [], () ->
  class Sequencer extends Backbone.View
    initialize: ->
      console.log "Loading sequencer"

    render: ->
      console.log "rendering!"
      @