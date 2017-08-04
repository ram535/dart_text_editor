import 'dart:html';
import 'dart:math';

void main() {
  DivElement contentDiv = new DivElement();
  CanvasElement graphs = new CanvasElement();

  graphs.width = 500;
  graphs.height = 270;

  int radius = 100;
  double lastpos = 0.0;

  CanvasRenderingContext2D c2d;
  c2d = graphs.getContext("2d");

  c2d
    ..fillStyle = "red"
    ..strokeStyle = "black"
    ..beginPath()
    ..moveTo(radius, radius)
    ..arc(radius, radius, radius, lastpos, (lastpos + (PI * 2.0)), false)
    ..lineTo(radius, radius)
    ..fill()
    ..stroke()
    ..closePath();

  contentDiv
    ..append(new BRElement())
    ..append(graphs);

  document.body.append(contentDiv);
}
