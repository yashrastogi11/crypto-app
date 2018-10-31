import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;



class Chart extends StatefulWidget{

  @override
  _State createState () => new _State();
}

class MarkSheet{
  String subject;
  int marks;
  MarkSheet(this.subject,this.marks);
}

class _State extends State<Chart> {

  List<MarkSheet> _data1;
  List<MarkSheet> _data2;
  List<charts.Series<MarkSheet, String>> _chartdata;



  void _makeData() {
    _data1 = new List<MarkSheet>();
    _data2 = new List<MarkSheet>();
    _chartdata = new List<charts.Series<MarkSheet, String>>();

    List sub = ["","Maths","Computer","DBMS", "OS", "Network Security"];

    final rnd = new Random();
    for(int i=1;i<6;i++) {
      _data1.add(new MarkSheet(sub[i], rnd.nextInt(50)));
      _data2.add(new MarkSheet(sub[i], rnd.nextInt(50)));
    }


    _chartdata.add(new charts.Series(
        id: "CAT 1",
        colorFn: (_,__) => charts.MaterialPalette.green.shadeDefault,
        data: _data1,
        domainFn: (MarkSheet markSheet, _) => markSheet.subject,
        measureFn: (MarkSheet markSheet, _) => markSheet.marks,
        fillPatternFn: (_,__) => charts.FillPatternType.solid,
        displayName: "Mark Sheet"
    )
    );

    _chartdata.add(new charts.Series(
       id: "CAT 2",
        colorFn: (_,__) => charts.MaterialPalette.red.shadeDefault,
        data: _data2,
        domainFn: (MarkSheet markSheet, _) => markSheet.subject,
        measureFn: (MarkSheet markSheet, _) => markSheet.marks,
        fillPatternFn: (_,__) => charts.FillPatternType.solid,
        displayName: "Mark Sheet"
    )
    );

  }

  @override
  void initState() {
    // TODO: implement initState
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mark Sheet Chart"),
      ),
      body: new Container(
        padding: EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Marks Data", style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.red)),
              new Expanded(
                child: new charts.BarChart(_chartdata, animate: true, animationDuration: new Duration(seconds: 2))
              )
            ],
          ),
        ),
      ),
    );
  }


}