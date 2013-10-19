class App extends Backbone.View
  el: '#main'

  initialize: ->
    @setup()

  setup: ->
    window.ac = new (window.AudioContext || window.webkitAudioContext)
    window.bpm = 120
    new Router()
    Backbone.history.start
      pushState: true
      root: '/'

  setTitle: (title) ->
    @$el.find("#title").html title

  render: ->
    @setTitle @title or 'My Repl Demo'
    @$el.append (new Controls).render().el
    @$el.append (new Sequencer).render().el
    @$el.append (new Sidebar).render().el
    @

window.App = App
