class Router extends Backbone.Router
  main: ->
    $ "#main"

  initialize: ->
    console.log "Loading router"

  routes:
    "": "home"

  home: ->
    console.log "Loading Home"
    view = new Home
    view.render()

window.Router = Router
