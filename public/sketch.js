var textfield;
var output;
var output2;
var finalText;
var socket;

function setup() {
  data = "";
  createCanvas(750, 1335);
  textfield = select("#haninput");
  textfield.input(newTyping);
  output = select('#output');
  output2 = select('#output2');
//   socket = io.connect('http://localhost:3000');
  socket = io.connect('http://165.194.69.166:3000');
  socket.on('textMessage',
    function(data) {
//       console.log(data);
print("recieved: "+data);
output2.html(data);
      // output2.html(data);
    }
  );
}

function newTyping() {
  output.html(textfield.value());
  finalText = textfield.value();
  sendText(finalText);
}

// function newText() {
//   createP(textfield.value());
// }

function sendText(textString) {
  var data = textString;
  socket.emit('textMessage', data);
}