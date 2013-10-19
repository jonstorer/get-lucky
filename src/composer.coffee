define [], () ->
  class Composer extends Backbone.View
    initialize: ->
      console.log "Loading composer"

    render: ->
      @$el.html _.template("Composer goes here")
      @