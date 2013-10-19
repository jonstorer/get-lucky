class Controls extends Backbone.View
  id: "controls"

  events: ->
    'click .play': 'play'

  initialize: ->
    console.log "Loading controls"

    @sequence = { }

    Exchange.on 'sample set', (position, sample) =>
      @sequence[position] or= []
      @sequence[position].push sample

  play: =>
    max + _(Object.keys(@sequence)).max
    x = 60*60*100 / 120
    for i in [0..max]
      do fn for fn in @sequence[i]

  render: ->
    @$el.html _.template("<div id='stopStart'></div>")
    @

window.Controls = Controls
