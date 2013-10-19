define [], () ->
  class Controls extends Backbone.View
    id: "controls"
    initialize: ->
      console.log "Loading controls"

    render: ->
      @$el.html _.template("Controls go here")
      @