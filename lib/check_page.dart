import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';


class CheckPage extends StatefulWidget {

  @override
  _CheckPageState createState () => new _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {

  final String title1="Yash";



  bool _value1 = false;
  bool _value2 = false;

  void _valueChanged1(bool value) => setState(() => _value1 = value);
  void _valueChanged2(bool value) => setState(() => _value2 = value);


  bool checkboxValue = false;

  double _value3 = 0.0;

  void _setValue(double value) => setState(() => _value3 = value);

  String _value4 = '';

//  Future _selectDate() async {
//    DateTime picked = await showDatePicker(
//        context: context,
//        initialDate: new DateTime.now(),
//        firstDate: new DateTime(2016),
//        lastDate: new DateTime(2020),
//    );
//   if(picked!=null) setState(() => _value4 = picked.toString());
//  }

  List<BottomNavigationBarItem> _item;
  String _value5 = '';


  int _index = 0;

  @override
  void initState() {
    _item = new List();
    _item.add(new BottomNavigationBarItem(icon: new Icon(Icons.people), title: new Text("People")));
    _item.add(new BottomNavigationBarItem(icon: new Icon(Icons.apps), title: new Text("Apps")));
    _item.add(new BottomNavigationBarItem(icon: new Icon(Icons.map), title: new Text("Map")));
  }

  void _showModalSheet(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return new Container(
          color: Colors.greenAccent,
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Expanded(child: new Image.asset("images/bitcoin.png")),
                new Expanded(child: new Image.asset("images/bitcoin.jpeg"))
              ],
            )
          ),
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Check Box List"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: new Text("789"),
                value: _value1,
                onChanged: _valueChanged1,
//              onChanged: (bool value) { setState(() { _value1 = value; }); }

//        value: checkboxValue,
//        onChanged: (bool value) {
//          setState(() {
//            checkboxValue = value;
//          });
//        },
              ),
              new SwitchListTile(
                value: _value2,
                onChanged: _valueChanged2,
                title: new Text("Hey", style: new TextStyle(fontSize: 20.0, color: Colors.green),),
              ),
              new Text("Value: ${(_value3).round()}"),
              new Slider(
                  value: _value3,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (double value) {setState((){_value3 = value;});}
              ),

              new Padding(padding: EdgeInsets.all(10.0)),
              new CircularProgressIndicator(value: _value3),

              new Text(_value4),
              new RaisedButton(onPressed: null, child: new Text("Click Me"),),

              new Padding(padding: EdgeInsets.all(30.0)),

              new RaisedButton.icon(
                icon: new Icon(Icons.attach_money),
                onPressed: ()=> _showModalSheet(context),
                label: new Text("Click me"),
              ),

              new Padding(padding: EdgeInsets.all(15.0)),

              new IconButton(
                icon: new Icon(Icons.send),
                onPressed: ()=> _showModalSheet(context),
                tooltip: "Click me",
              ),



            ],
          ),
        ),
      ),
//      bottomNavigationBar: new BottomNavigationBar(
//        items: _item,
//        fixedColor: Colors.orange,
//        onTap: (int item) {
//          setState(() {
//            _index = item;
//            _value5 = "Current Value";
//          });
//        },
//        currentIndex: _index,
//      ),
    );
  }


}
