import 'dart:async';
import 'dart:convert';
import 'package:crypto_it/new_page.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:crypto_it/home_page.dart';



void main() async {

  List currencies = await getCurrencies();
  print(currencies);
  runApp(new MyApp(currencies));
}

class MyApp extends StatelessWidget {

  final List _currencies;

  MyApp (this._currencies);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Crypto Rate",
      theme: new ThemeData(
        primarySwatch: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[100] : Colors.orange,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS?Colors.grey[100]:null,
      ),
      home: new HomePage(_currencies),

//      routes: <String, WidgetBuilder>{
//        "/a": (BuildContext context) => new NewPage("New Page"),
//      },
    );
  }
}


Future<List> getCurrencies() async{
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(cryptoUrl);
  return json.decode(response.body);
}


Future<List> convert() async{
  String convertUrl = "https://free.currencyconverterapi.com/api/v6/convert?q=USD_INR&compact=y";
  http.Response response = await http.get(convertUrl);
  return json.decode(response.body);
}
