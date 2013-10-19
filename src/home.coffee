define [], () ->
  class Home extends Backbone.View
    initialize: ->
      console.log "home"

    render: ->
      console.log "rendering!"