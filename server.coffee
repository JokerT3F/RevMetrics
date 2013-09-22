http = require 'http'
{Task} = require './src/task'

#http.createServer (req, res) ->
#  res.writeHead 200, {'Content-Type': 'text/plain'}
#  
#  task1 = new Task 'MA NOUVELLE TACHE'
#  
#  
#  res.end 'Hello Task\n' + task1.name
#.listen process.env.PORT, process.env.IP

#onRequest = (req, res) ->
#    res.writeHead 200, { 'Content-Type': 'text/plain' }
#    res.end 'Hello Worldasdf\n'
#
#http.createServer(onRequest).listen(process.env.PORT)

#express = require 'express'
#app = express()
#
#app.get '/', (req, res) ->
#    res.send 'Hello World'
#
#app.get '/users/:id', (req, res) ->
#    res.send 'user ' + req.params.id
#    
#app.listen process.env.PORT

express = require 'express'
app = express()

before1 = (req, res, next) ->
    req.foo = 'bar'
    next()
    
before2 = (req, res, next) ->
    res.header('X-Time', new Date().getTime())
    next()

app.get '/', before1, (req, res) ->
    res.send 'Hello World'

app.get '/users/:id', [before1, before2], (req, res) ->
    console.log req.foo
    res.send 'user ' + req.params.id

app.listen process.env.PORT
 
console.log 'Server running at http://' + process.env.IP + ':' + process.env.PORT+ '/'