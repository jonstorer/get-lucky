cs      = require 'coffee-script'
fs      = require 'fs'
express = require('express')
app     = express()

paths = [
  'bower_components/jquery/jquery.min.js',
  'bower_components/jquery-ui/ui/jquery-ui.js',
  'bower_components/underscore/underscore-min.js',
  'bower_components/backbone/backbone-min.js',
  'src/app.coffee',
  'src/main.coffee',
  'src/composer.coffee',
  'src/controls.coffee',
  'src/home.coffee',
  'src/router.coffee',
  'src/sequencer.coffee'
]

app.get '/app.js', (req, res) ->
  res.set('Content-Type', 'text/javascript')
  scripts = for path in paths
    data = fs.readFileSync(path, 'utf8')
    if match = path.match(new RegExp(/js$/))
      data.toString()
    else
      cs.compile data
  res.send scripts.join("\n")

app.use express.static(__dirname + '/public')
app.use express.static(__dirname + '/bower_components')

port = process.env.PORT || 3033
app.listen port
console.log "running on #{port}"
