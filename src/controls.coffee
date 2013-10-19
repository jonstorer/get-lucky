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
    getlucky.doplay()
    

    # max = _(Object.keys(@mySong)).max()
    # x = 60*100 / window.bpm

    # for i in [0..max]
    #   for sample in @mySong[i] || []
    #     do (sample) =>
    #       setTimeout =>
    #         sample = sample(@repl.create)
    #         sample?.play?(bpm) || @repl.create(sample).play(bpm)
    #       , i * x

  render: ->
    @$el.html _.template("<div align='center' style='width:100%;'><img class='play' id='' src='/images/play.png'/ width='50px' style='margin-top: 10px;'></div>")
    @

window.Controls = Controls
