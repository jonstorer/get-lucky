express = require('express')
app     = express()

app.use express.static(__dirname + '/public')
app.use express.static(__dirname + '/bower_components')

app.listen(3033)

console.log 'running'
