class Sequencer extends Backbone.View
  id: "sequencer"
  initialize: ->
    console.log "Loading sequencer"

  render: ->
    @$el.append (new Track).render().el
    @$el.append (new Track).render().el
    @$el.append (new Track).render().el

    #@$el.find('.sample').draggable
      #snap: '.beat',
      #snapTolerance: 10

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

window.Sequencer = Sequencer
