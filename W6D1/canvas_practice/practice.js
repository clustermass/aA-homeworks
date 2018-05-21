document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementById('mycanvas'); // in your HTML this element appears as <canvas id="myCanvas"></canvas>
  var ctx = canvas.getContext('2d');

  canvas.width = 500;
  canvas.height = 500;

  ctx.fillStyle = "red";
  ctx.fillRect(100, 100, 300, 300);

  ctx.beginPath();
  ctx.arc(300, 300, 60, 0, 360);
  ctx.strokeStyle = "black";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "yellow";
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(400, 400);
  ctx.lineTo(400, 560);
  ctx.lineTo(560, 560);
  ctx.closePath();
  ctx.strokeStyle = 'purple';
  ctx.stroke();
  ctx.fillStyle = "green";
  ctx.fill();

});
