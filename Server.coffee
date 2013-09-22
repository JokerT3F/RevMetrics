http = require 'http'
{Task} = require './src/task'


http.createServer (req, res) ->
  res.writeHead 200, {'Content-Type': 'text/plain'}
  
  task1 = new Task 'MA NOUVELLE TACHE'
  
  
  res.end 'Hello Task\n' + task1.name
.listen process.env.PORT, process.env.IP
 
console.log 'Server running at http://' + process.env.IP + ':' + process.env.PORT+ '/'