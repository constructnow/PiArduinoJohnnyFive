var five = require("johnny-five");

var board = new five.Board();
var port = 3030;

var express = require('express'),
    app = express(),
    http  = require('http').Server(app),
    io = require('socket.io')(http);

app.use('/rangeslider', express.static(__dirname + '/node_modules/rangeslider.js/dist/'));
app.get('/', function(req, res,next) {  
    res.sendFile(__dirname + '/index.html');
});

io.on('connection', function(socket){
    console.log("A user connected");
    socket.on('disconnect', function(){
        console.log('A user disconnected');
    });
    socket.on('changeLight', function(obj){
        console.log("received changeLight object", obj);
        board.emit("changeLight", obj);
    });
});

http.listen(port, function() {
    console.log("listening on port " + port);
});

board.on("ready", function() {

    console.log('Board is ready');

    var myLED = new five.Led(11);
    
    board.repl.inject({
        ledRed: myLED
    });

    board.on('changeLight', function(obj){
        if(obj.lightValue==null)obj.lightValue=0;
        console.log("Turning brightness to ", obj.lightValue);
        myLED.brightness(obj.lightValue);
    });

    this.on('exit', function(){
        io.emit('server_exit');
        myLED.brightness(0);
    });

});