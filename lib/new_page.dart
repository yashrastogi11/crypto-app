import 'package:flutter/material.dart';

class NewPage extends StatelessWidget{
  final String title;

  NewPage(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Text(title),
      ),
    );
  }
}
