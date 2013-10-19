define [
  "router",
  "composer",
  "controls",
  "sequencer",
  "track",
  "jquery-ui/ui/jquery-ui.js"
  ], (Router, Composer, Controls, Sequencer, Track) ->
    
  class App extends Backbone.View
    el: $ "#main"

    initialize: ->
      console.log "Loading app"
      @setup()

    render: ->
      @setTitle @title or "My Repl Demo"

      # Set up the play controls
      controls = new Controls      
      @$el.append controls.render().el

      # Set up the interactive composer and library
      composer = new Composer
      @$el.append composer.render().el

      # Set up the sequencer area
      sequencer = new Sequencer
      @$el.append sequencer.render().el
      
      @

    setup: ->
      new Router()
      Backbone.history.start
        pushState: true
        root: "/"

    setTitle: (title) ->
      @$el.find("#title").html title
      