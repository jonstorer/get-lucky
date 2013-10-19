define ["router"], (Router) ->
  class App extends Backbone.View

    initialize: ->
      console.log "Loading app"

    render: ->
      @$el.html "<h1>Hello World</h1>"
      @setup()
      @

    setup: ->
      new Router()
      Backbone.history.start
        pushState: true
        root: "/"