cs      = require 'coffee-script'
fs      = require 'fs'
express = require('express')
app     = express()

app.use express.static(__dirname + '/public')
app.use express.static(__dirname + '/bower_components')

app.get '/src/:path.js', (req, res) ->
  res.set('Content-Type', 'text/javascript')
  res.send cs.compile fs.readFileSync("src/#{req.params.path}.coffee", 'utf8')

app.listen(3033)

console.log 'running'
