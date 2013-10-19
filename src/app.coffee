define [
  "router",
  "composer",
  "controls",
  "sequencer"], (Router, Composer, Controls, Sequencer) ->
    
  class App extends Backbone.View
    el: $ "#main"

    initialize: ->
      console.log "Loading app"
      @setup()

    render: ->
      @setTitle @title or "My Repl Demo"
      controls = new Controls      
      @$el.append controls.render().el
            
      composer = new Composer
      @$el.append composer.render().el

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
      