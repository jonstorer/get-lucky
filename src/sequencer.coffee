class Sequencer extends Backbone.View
  id: "sequencer"

  initialize: ->
    console.log "Loading sequencer"

  render: ->
    @$el.append (new Track(title: 'Melody')).render().el
    @$el.append (new Track(title: 'Harmony')).render().el
    @$el.append (new Track(title: 'Bass')).render().el
    @$el.append (new Track(title: 'Drums')).render().el

    @$el.find('.beat').droppable
      accept: '.sample',
      activeClass: 'active',
      hoverClass: 'hover',
      drop: (e, ui) ->
        beat   = $(@).data('beat')
        sample = ui.draggable.data('view').sample
        Exchange.trigger 'save.sample.to.the.sequence', beat, sample

    @

window.Sequencer = Sequencer
