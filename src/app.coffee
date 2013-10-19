class App extends Backbone.View
  el: '#main'

  initialize: ->
    @setup()

  setup: ->
    new Router()
    Backbone.history.start
      pushState: true
      root: "/"

  setTitle: (title) ->
    @$el.find("#title").html title

  render: ->
    @setTitle @title or 'My Repl Demo'
    @$el.append (new Controls).render().el
    @$el.append (new Composer).render().el
    @$el.append (new Sequencer).render().el
    @

window.App = App
