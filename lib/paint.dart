import 'package:flutter/material.dart';

class _Painter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size){

    final radius = 100.0;
    final Offset offset = new Offset(0.0, 75.0);
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.orange[500]
      ..style = PaintingStyle.stroke;

    final Offset bodystart = new Offset(0.0, 50.0);
    final Offset bodyend = new Offset(0.0, 0.0);

    canvas.drawCircle(offset, radius, paint);
    canvas.drawLine(bodystart, bodyend, paint);

    final Rect rect = new Rect.fromCircle(center: offset, radius: radius);
    final Paint rectPaint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    canvas.drawRect(rect, rectPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class Painting extends StatefulWidget{

  @override
  _State createState() => new _State();
}


class _State extends State<Painting> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Let's Paint"),
      ),
      body: new Container(
        padding: EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Hello", style: new TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
              new Padding(padding: EdgeInsets.all(32.0)),
              new CustomPaint(painter: new _Painter(),),
            ],
          ),
        ),
      ),
    );
  }
}