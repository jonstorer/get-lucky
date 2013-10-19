define ["track"], (Track) ->
  class Sequencer extends Backbone.View
    id: "sequencer"
    initialize: ->
      console.log "Loading sequencer"

    render: ->
      track = new Track
      @$el.append track.render().el
      track = new Track
      @$el.append track.render().el      
      
      @$el.find('.sample').draggable
        snap: '.beat',
        snapTolerance: 10

      @$el.find('.beat').droppable
        accept: '.sample',
        activeClass: 'active',
        hoverClass: 'hover',
        drop: (e, ui) ->
          console.log @.id
          console.log ui.helper
          console.log ui.draggable
          console.log 'dropped'
      
      @