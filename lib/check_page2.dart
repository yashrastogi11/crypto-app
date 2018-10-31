import 'package:flutter/material.dart';
import 'dart:math';

class CheckPage2 extends StatefulWidget {

  @override
  _CheckPage2State createState () => new _CheckPage2State();
}

class Area {
  int index;
  String name;
  Color color;
  Area({this.index: -1, this.name: 'Area', this.color: Colors.lightBlueAccent});
}




class _CheckPage2State extends State<CheckPage2> {

  int _location;
  List<Area> _areas;


  @override
  void initState() {
    _areas = new List<Area>();
    for(int i = 0; i< 16; i++) {
      _areas.add(new Area(index: i, name: 'Area $i', color: Colors.lightBlueAccent));
    }

    var rng = new Random();
    _location = rng.nextInt(_areas.length);
  }

  void newGame() {

    _areas.clear();
    for(int i = 0; i< 16; i++) {
      _areas.add(new Area(index: i, name: 'Area $i', color: Colors.lightBlueAccent));
    }

    new Center(
      child: new GridView.count(

        crossAxisCount: 4,
        children: new List<Widget>.generate(16, _generate),
      ),
    );

    var rng = new Random();
    _location = rng.nextInt(_areas.length);
  }

  Widget _generate(int index) {
    return new GridTile(
      child: new Container(
        padding: new EdgeInsets.all(5.0),
        child: new RaisedButton(
          onPressed: () => _onPressed(index),
          color: _areas[index].color,
          child: new Text(_areas[index].name, textAlign: TextAlign.center),
        ),
      ),
    );
  }


  void _onPressed(int index) {
    setState((){
      if(index == _location) {
        _areas[index].color = Colors.green;

        showDialog(context: context, child: _display());
//       showDialog(context: context, child: _display);
      }
      else {
        _areas[index].color = Colors.red;
      }
    });
  }

//  Widget _dialog = new AlertDialog(
//    title: new Text("Yash"),
//    content: new SingleChildScrollView(
//      child: new ListBody(
//        children: <Widget>[
//          new Text('Hello There'),
//          new Text('You are like me. I am never satisfied.'),
//        ],
//      ),
//    ),
//  );

  Widget _display() {
    return new Container(
      decoration: BoxDecoration(color: Colors.white),
      child: new AlertDialog(
        title: new Text("Congratulations"),
        content: new Text("Winner"),
        actions: <Widget>[
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text("Play Again"),
            onPressed: () {
              newGame();
              Navigator.of(context).pop();
//              Navigator.of(context).canPop();

            },
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new GridView.count(

            crossAxisCount: 4,
            children: new List<Widget>.generate(16, _generate),
          ),
        ),
      ),
    );
  }
}