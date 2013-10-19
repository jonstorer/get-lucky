require [
  "underscore"
  "backbone"
  "app"
], (_, Backbone, App) ->
  $ ->
    window.app = new App
    $("#main").html window.app.render().el