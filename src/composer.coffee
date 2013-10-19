define [], () ->
  class Composer extends Backbone.View
    initialize: ->
      console.log "Loading composer"

    render: ->
      console.log "rendering!"
      @