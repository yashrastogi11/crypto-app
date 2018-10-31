import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


class animation extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Animated extends AnimatedWidget {

  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 300.0);
  static final _rotateTween = new Tween<double>(begin: 0.0, end: 12.0);

  Animated({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return new Center(
      child: new Transform.rotate(angle: _rotateTween.evaluate(animation),
        child: new Opacity(opacity: _opacityTween.evaluate(animation),
          child: new Container(
            margin: new EdgeInsets.symmetric(vertical: 10.0),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: new Image.asset("images/lion.png"),
          ),
        ),
      ),
    );
  }
}


class _State extends State<animation> with TickerProviderStateMixin {

  Animation animation;
  AnimationController controller;


  @override
  void initState() {
    super.initState();

    controller = new AnimationController( duration: const Duration(seconds: 10),vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener(listener);
//    animation.addListener(() {
//      setState(() {
       //The state of the animation has changed
//      });
//    });

    controller.forward();
  }

  void listener(AnimationStatus status) {
    if(status == AnimationStatus.completed) {
      controller.reverse();
    } else if(status == AnimationStatus.dismissed) {
      controller.forward();
    }
  }

//  Widget builder(BuildContext context, Widget child) {
//    return new Container(
//      height: animation.value,
//      width: animation.value,
//      child: new Image.asset("images/lion.png"),
//    );
//  }


//  @override
// void dispose() {
//    controller.dispose();
//   super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Animations'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Animated(animation: animation,)
      ),
    );
  }
}