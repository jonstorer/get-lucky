class Sequencer extends Backbone.View
  id: "sequencer"
  initialize: ->
    console.log "Loading sequencer"

    @trackTemplate = _.template """
    <div>
      <span> <%= name %> </span>
      <div class='track'>
        <% _(numBeats).times(function() { %>
          <div class='beat'></div>
        <% }); %>
      </div>
    </div>
    """

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

    @$el.append @trackTemplate( numBeats: 100, name: 'Melody' )
    @$el.append @trackTemplate( numBeats: 100, name: 'Rhythm' )
    @$el.append @trackTemplate( numBeats: 100, name: 'Drums' )
    @$el.append @trackTemplate( numBeats: 100, name: 'Bass' )

    @$('.beat').droppable
      accept: '.sample',
      activeClass: 'active',
      hoverClass:'hover',
      drop: (event, ui) ->
        console.log('dropped')

    @

window.Sequencer = Sequencer
>>>>>>> master
