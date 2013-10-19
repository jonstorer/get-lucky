require [
  "underscore"
  "backbone"
  "app"
], (_, Backbone, App) ->
  $ ->
    window.app = new App
    window.app.render()