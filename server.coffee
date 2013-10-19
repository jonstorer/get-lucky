cs      = require 'coffee-script'
fs      = require 'fs'
express = require 'express'
uglify  = require 'uglifyjs'
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
  output = ''
  for path in paths
    output += '//\n'
    output += '// ' + path + '\n'
    output += '//\n'
    data = fs.readFileSync(path, 'utf8')
    script = if path.match(new RegExp(/js$/)) then data.toString() else cs.compile data
    output += uglify.minify(script, fromString: true).code + '\n'

  res.send output

app.use express.static(__dirname + '/public')
app.use express.static(__dirname + '/bower_components')

port = process.env.PORT || 3033
app.listen port
console.log "running on #{port}"
