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
