import 'dart:async';
import 'dart:convert';
import 'package:crypto_it/Contacts.dart';
import 'package:crypto_it/URL.dart';
import 'package:crypto_it/animation.dart';
import 'package:crypto_it/camera.dart';
import 'package:crypto_it/chart.dart';
import 'package:crypto_it/check_page2.dart';
import 'package:crypto_it/map.dart';
import 'package:crypto_it/permission.dart';
import 'package:crypto_it/time.dart';
import 'package:crypto_it/main.dart';
import 'package:crypto_it/new_page.dart';
import 'package:crypto_it/check_page.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:crypto_it/paint.dart';



class HomePage extends StatefulWidget{

  final List currencies;
  HomePage(this.currencies);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {


//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: new Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: new Column(
//          children: <Widget>[
//            new RaisedButton(
//              onPressed: ()=> _signIn().then((FirebaseUser user)=>print(user)).catchError((e)=>print(e)),
//              child: new Text("Sign In"),
//              color: Colors.green,
//            ),
//
//          ],
//        ),
//      ),
//    );
//  }




  List currencies;

  final List<MaterialColor> _colors = [Colors.blue,Colors.indigo,Colors.deepPurple];




  Widget _dialog = new AlertDialog(
    title: new Text("Yash"),
    content: new SingleChildScrollView(
      child: new ListBody(
        children: <Widget>[
          new Text('Hello There'),
          new Text('You are like me. I am never satisfied.'),
        ],
      ),
    ),
  );







  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Live Crypto App"),
        elevation: defaultTargetPlatform == TargetPlatform.android?5.0:0.0,
        toolbarOpacity: 1.0,
        centerTitle: false,
        leading: null,
        automaticallyImplyLeading: true,
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Yash Rastogi", textScaleFactor: 1.3),
              accountEmail: new Text("yashrastogi11@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor:Theme.of(context).platform == TargetPlatform.iOS? Colors.teal:Colors.white,
                child: new Text("Y", textScaleFactor: 2.0),
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor:Theme.of(context).platform == TargetPlatform.iOS? Colors.teal:Colors.white,
                  child: new Text("R", textScaleFactor: 1.1),
                ),
              ],
            ),
            new ListTile(
              title: new Text("Trial"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).canPop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>
                    new CheckPage()
                ));
              },
            ),
            new ListTile(
              title: new Text("Game"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>
                    new CheckPage2()
                ));
              },
            ),
            new ListTile(
              title: new Text("Chart"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>
                    new Chart()
                ));
              },
            ),
            new ListTile(
              title: new Text("Time"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>
                    new Time()
                ));
              },
            ),
            new ListTile(
              title: new Text("Paint"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>
                    new Painting()
                ));
              },
            ),
            new ListTile(
              title: new Text("Animation"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>
                    new animation()
                ));
              },
            ),
            new ListTile(
              title: new Text("Maps"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>
                    new Maps()
                ));
              },
            ),
            new ListTile(
              title: new Text("URL"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>
                    new Url()
                ));
              },
            ),
            new ListTile(
              title: new Text("Permissons"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>
                    new Permissions()
                ));
              },
            ),
            new ListTile(
              title: new Text("Contacts"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>
                    new Contacts()
                ));
              },
            ),
            new ListTile(
              title: new Text("Caemra"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>
                    new Camera()
                ));
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: new RefreshIndicator(
        onRefresh: () async {
         await new Future.delayed(new Duration(seconds: 2));
          _cryptoWidget();
        },
        child: _cryptoWidget()
      ),
    );
  }

  Widget _cryptoWidget(){
    return new Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: new Column(
          children: <Widget>[new Flexible(
            child: new ListView.builder(
              itemCount: widget.currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final Map currency = widget.currencies[index];
                final MaterialColor color = _colors[index % _colors.length];
                RaisedButton(onPressed: null,child: new Text("Hello"),);

                return _getListItemUi(currency,color);
              },
            ),
          ),
          ]
      ),
    );
  }


  ListTile _getList(Map currency){
    return new ListTile(
      title: new Text(currency['symbol'], style: new TextStyle(fontWeight: FontWeight.bold)),
    );
  }


  ListTile _getListItemUi(Map currency, MaterialColor color){
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new FlatButton(
          child: new Text(
            currency['name'][0],
            style: new TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          onPressed: () {
            showDialog(context: context, child: _dialog);
          },
        ),
      ),
      title: new Text(currency['name'], style: new TextStyle(fontWeight: FontWeight.bold)),
      subtitle: _getSubtitleText(currency['price_usd'], currency['percent_change_1h']),
      isThreeLine: true,
    );
  }

  double rate;
  String conversion;


//  Future<List> convert() async {
//    var response = await http.get(
//        "https://free.currencyconverterapi.com/api/v6/convert?q=USD_INR&compact=y");
//    var jsonResponse = json.decode(response.body);
//    var line = jsonResponse["val"];
//    print(line);
//    return line;
//  }





  Widget _getSubtitleText(String priceUSD, String percentageChange){


    TextSpan priceTextWidget = new TextSpan(
        text: ("\$$priceUSD\n"),
        style: new TextStyle(color: Colors.black)
    );
    String percentageChangeText = "1 hour: $percentageChange%";
    TextSpan percentageChangeTextWidget;

    if(double.parse(percentageChange)>0){
      percentageChangeTextWidget = new TextSpan(text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    }
    else{
      percentageChangeTextWidget = new TextSpan(text: percentageChangeText,
          style: new TextStyle(color: Colors.red));
    }

    return new RichText(
        text: new TextSpan(
            children: [priceTextWidget,percentageChangeTextWidget]
        )
    );
  }



//  AlertDialog dialog = new AlertDialog(
//    title:  _getSubtitleText(currency['price_usd'], currency['percent_change_1h']),
//    content: new SingleChildScrollView(
//      child: new ListBody(
//        children: <Widget>[
//          new Text('Hello Shlok'),
//          new Text('You\â€™re like me. Iâ€™m never satisfied.'),
//        ],
//      ),
//    ),
//  );

}

class SecondPage extends StatelessWidget{

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
//      routes: <String, WidgetBuilder>{
//        "/a": (BuildContext context) => new NewPage("New Page"),
//      },
    );
  }
}

//Future<List> getCurrencies() async{
//  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
//  http.Response response = await http.get(cryptoUrl);
//  return json.decode(response.body);
//}




//class Information extends StatelessWidget{
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//
//    AlertDialog dialog = new AlertDialog(
//      title:  _getSubtitleText(currency['price_usd'], currency['percent_change_1h']),
//      content: new SingleChildScrollView(
//        child: new ListBody(
//          children: <Widget>[
//           new Text('Hello Shlok'),
//            new Text('You\â€™re like me. Iâ€™m never satisfied.'),
//          ],
//        ),
//      ),
//    );
//  }
//}



// onPressed: () =>
// (context: context, child: _dialog),
