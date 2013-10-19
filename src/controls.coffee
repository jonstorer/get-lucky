class Controls extends Backbone.View
  id: "controls"

  events: ->
    'click .play': 'play'

  initialize: ->
    console.log "Loading controls"
    @repl = soundrepl.init(window.ac)

    @mySong = { }

    Exchange.on 'save.sample.to.the.sequence', (position, sample) =>
      console.log arguments
      @mySong[position] or= []
      @mySong[position].push sample
      console.log @mySong

  play: (e) =>
    e.preventDefault()

    max = _(Object.keys(@mySong)).max()
    x = 60*100 / window.bpm

    for i in [0..max]
      for sample in @mySong[i] || []
        setTimeout =>
          sample = sample(@repl.create)
          sample?.play?(bpm) || @repl.create(sample).play(bpm)
        , i * x

  render: ->
    @$el.html "<div id='stopStart'> <a href='#' class='play'>Play</a> </div>"
    @

window.Controls = Controls
