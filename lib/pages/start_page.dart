import 'dart:async';
import 'package:flutter/material.dart';
import 'index_page.dart';

class StartPage extends StatefulWidget {
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = new Timer(const Duration(milliseconds: 3000), () {
      try {
        print(1);
        Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(
            builder: (BuildContext context) => IndexPage()), (//跳到登陆页面
            Route route) => route == null);
        print(2);
      } catch (e) {
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: new Color.fromARGB(255, 0, 215, 198),
      child: new Padding(
        padding: const EdgeInsets.only(
          top: 150.0,
        ),
        child: new Column(
          children: <Widget>[
            new Text("金剪子",
              style: new TextStyle(color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}