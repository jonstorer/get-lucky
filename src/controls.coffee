class Controls extends Backbone.View
  id: "controls"
  initialize: ->
    console.log "Loading controls"

  render: ->
    @$el.html _.template("<div id='stopStart'></div>")
    @

window.Controls = Controls
