import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class Url extends StatefulWidget {
  @override
  _State createState () => new _State();
}

class _State extends State<Url>{

  void _showUrl() {
    _launch('http://www.google.com');
  }

  void _showEmail() {
    _launch('mailto:yashrastogi11@gmail.com');
  }

  void _showSms() {
    _launch('sms:8094696587');
  }

  void _showTelephone() {
    _launch('tel:8094696587');
  }

  void _launch(String urlString) async {
    if(await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'Could not launch Url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('URL'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(onPressed: _showUrl, child: new Text('URL'), color: Colors.amberAccent, splashColor: Colors.red,),
                new RaisedButton(onPressed: _showEmail, child: new Text('Email'),),
                new RaisedButton(onPressed: _showSms, child: new Text('Sms'),),
                new RaisedButton(onPressed: _showTelephone, child: new Text('Telephone'),),
                new IconButton(icon: new Icon(Icons.call), onPressed: _showTelephone, color: Colors.red, highlightColor: Colors.lightGreen, iconSize: 40.0, tooltip: "Make a Call", splashColor: Colors.green,),
              ],
            ),
          )
      ),
    );
  }
}

