define [
  "router",
  "composer",
  "controls",
  "sequencer"
  "jquery-ui/ui/jquery-ui.js"
  ], (Router, Composer, Controls, Sequencer) ->
    
  class App extends Backbone.View
    el: $ "#main"

    initialize: ->
      console.log "Loading app"
      @setup()

    render: ->
      $('.sample').draggable
        snap: '.beat',
        snapTolerance: 10

      $('.beat').droppable
        accept: '.sample',
        activeClass: 'active',
        hoverClass: 'hover',
        drop: (e, ui) ->
          console.log @.id
          console.log ui.helper
          console.log ui.draggable
          console.log 'dropped'

      
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
      