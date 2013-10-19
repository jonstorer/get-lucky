define [
  "router",
  "composer",
  "controls",
  "sequencer"], (Router, Composer, Controls, Sequencer) ->
    
  class App extends Backbone.View

    initialize: ->
      console.log "Loading app"
      @setup()

    render: ->
      controls = new Controls
      # controls.render().el
      @$el.html "<h1>Hello World</h1>"
            
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