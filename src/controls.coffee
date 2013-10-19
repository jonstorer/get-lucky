class Controls extends Backbone.View
  id: "controls"
  initialize: ->
    console.log "Loading controls"

  render: ->
    @$el.html _.template("<div align='center'><img class='play' src='/images/play.png'/ width='50px' style='margin-top: 10px;'></div>")
    @

window.Controls = Controls
