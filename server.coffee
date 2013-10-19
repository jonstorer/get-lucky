requirejs = require 'requirejs'

require.config =
  baseUrl: ''
  name:    'main'
  out:     'tmp/tmp.js'
  deps: ['jquery', 'jqueryui', 'backbone', 'handlebars', 'backbone_handlebars', 'main']
  paths:
    underscore:          '../underscore/underscore-min'
    jquery:              '../jquery/jquery.min'
    jqueryui:            '../jquery-ui/ui/jquery-ui'
    backbone:            '../backbone/backbone-min'
    backbone_handlebars: '../backbone.handlebars/dist/backbone.handlebars.min'
    handlebars:          '../handlebars/handlebars'
  hbs:
    templateExtension : 'hbs'
    disableI18n: true
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: ['underscore']
      exports: 'Backbone'
    backbone_handlebars:
      deps: ['backbone']
    jqueryui:
      deps: ['jquery']

requirejs.optimize config, (buildResponse) ->
  contents = fs.readFileSync(config.out, 'utf8')
, (err) ->
  console.log err

cs      = require 'coffee-script'
fs      = require 'fs'
express = require('express')
app     = express()

app.use express.static(__dirname + '/public')
app.use express.static(__dirname + '/bower_components')
app.use express.static(__dirname + '/css')

app.get '/src/:path.js', (req, res) ->
  res.set('Content-Type', 'text/javascript')
  res.send cs.compile fs.readFileSync("src/#{req.params.path}.coffee", 'utf8')

port = process.env.PORT || 3033
app.listen port
console.log "running on #{port}"
