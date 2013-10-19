define [], () ->
  class Sequencer extends Backbone.View
    id: "sequencer"
    initialize: ->
      console.log "Loading sequencer"

    render: ->
      @$el.html _.template("Sequencer goes here")
      @