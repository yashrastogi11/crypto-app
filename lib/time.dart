import 'package:flutter/material.dart';
import 'my_Widget.dart';

class Time extends StatefulWidget{

  @override
  _TimeState createState () => new _TimeState();
}

class _TimeState extends State<Time> {

  bool _visible = true;

  void _toggleVisible () {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Current Time"),
      ),
      body: new Container(
        padding: EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Time is:"),
              new Opacity(
                opacity: _visible ? 1.0 : 0.2,
                child: new Clock()
              ),
              new RaisedButton(onPressed: _toggleVisible, child: new Text("Tap to toggle"),)
            ],
          ),
        ),
      ),
    );
  }
}