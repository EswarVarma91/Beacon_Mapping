
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final green = Paint();
    final red = Paint();
    final beacon = Paint();
    final person = Paint();

    green.color = Colors.green;
    red.color = Colors.red;
    beacon.color = Colors.deepOrangeAccent;
    person.color = Colors.blue;

    canvas.drawRect(Rect.fromPoints(Offset(45, 10), Offset(05, 45)), green);
    canvas.drawRect(Rect.fromPoints(Offset(355, 500), Offset(315, 460)), red);

    canvas.drawRect(Rect.fromPoints(Offset(15, 50), Offset(05, 500)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(50, 10), Offset(350, 20)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(310, 490), Offset(05, 500)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(355, 10), Offset(345, 455)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(60, 60), Offset(80, 455)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(130, 60), Offset(110, 455)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(180, 60), Offset(160, 455)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(325, 80), Offset(200, 60)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(325, 120), Offset(200, 100)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(325, 160), Offset(200, 140)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(325, 200), Offset(200, 180)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(325, 240), Offset(200, 220)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(325, 280), Offset(200, 260)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(325, 320), Offset(200, 300)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(325, 360), Offset(200, 340)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(325, 400), Offset(200, 380)), Paint());
    canvas.drawRect(Rect.fromPoints(Offset(325, 440), Offset(200, 420)), Paint());

    canvas.drawCircle(Offset(10, 480), 8, beacon); //F1:A8:EF:DE:47:0C front
    canvas.drawCircle(Offset(200, 15), 8, beacon); //DF:0A:38:41:1F:C9 lback
    canvas.drawCircle(Offset(229, 374), 8, person);
    canvas.drawCircle(Offset(290, 495), 8, beacon); //E9:48:B5:E5:57:A1 rback
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}


