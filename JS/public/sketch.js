var textfield;
var output;
var output2;
var finalText;
var socket;
var textFinal;

function setup() {
  data = "";
  createCanvas(750, 1335);
  textfield = select("#haninput");
  textfield.input(newTyping);
  output = select('#output');
  output2 = select('#output2');
//   socket = io.connect('http://localhost:3000');
  socket = io.connect('http://165.194.69.166:3000');//Office Mac
//   socket = io.connect('http://192.168.0.101:3000');//Home Mac
//   socket = io.connect('http://165.194.69.145:3000');//Office Windows
  socket.on('message', function(data) {

output2.html(data);
    }
  );
}

function newTyping() {
  output.html(textfield.value());
  finalText = textfield.value();
  sendText(finalText);
}

function sendText(textString) {
  var data = textString;
  socket.broadcast.emit('message', data);
}