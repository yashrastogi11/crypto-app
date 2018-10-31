import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Maps extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<Maps> {

  MapController mapController;
  Map<String, LatLng> coords;
  List<LatLng> points;
  List<Marker> markers;

  @override
  void initState(){
    mapController = new MapController();

    points = new List<LatLng>();
    points.add(new LatLng(28.6330, 77.2194));
    points.add(new LatLng(28.5562, 77.1000));
    points.add(new LatLng(28.5245, 77.1855));


    coords = new Map<String, LatLng>();
    coords.putIfAbsent("Rajiv Chowk", () => new LatLng(28.6330, 77.2194));
    coords.putIfAbsent("IGI", () => new LatLng(28.5562, 77.1000));
    coords.putIfAbsent("Qutub Minar", () => new LatLng(28.5245, 77.1855));

    markers = new List<Marker>();

    for(int i = 0; i < coords.length; i++) {
      markers.add(
        new Marker(
          width: 80.0,
          height: 80.0,
          point: coords.values.elementAt(i),
          builder: (ctx) => new Icon(Icons.pin_drop, color: Colors.red)
        )
      );
    }
  }

  void _showCoord (int index) {
    mapController.move(coords.values.elementAt(index), 15.0);
  }

  List<Widget> _makeButtons() {
    List<Widget> list = new List<Widget>();

    for(int i = 0; i < coords.length; i++) {
      list.add(new RaisedButton(onPressed: () => _showCoord(i), child: new Text(coords.keys.elementAt(i)),));
    }
    return list;
  }


  @override
  Widget build(BuildContext context) {

//    var markers = <Marker>[
//      new Marker(
//        width: 80.0,
//        height: 80.0,
//        point: new LatLng(28.6330, 77.2194),
//        builder: (ctx) => new Icon(Icons.pin_drop, color: Colors.red,)
//      ),
//    ];

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Map"),
      ),
      body: new Container(
        padding: EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                children: _makeButtons(),
              ),
              new Flexible(
                child: new FlutterMap(
                  mapController: mapController,
                  options: new MapOptions(
                      center: new LatLng(28.6139, 77.2090),
                      zoom: 10.0
                  ),
                  layers: [
                    new TileLayerOptions(
                      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a','b','c'],
                    ),
                    new MarkerLayerOptions(markers: markers),
                    new PolylineLayerOptions(
                      polylines: [
                        new Polyline(
                          points: points,
                          strokeWidth: 4.0,
                          color: Colors.purple,
                        )
                      ]
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}