import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'pages/start_page.dart';


void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '金剪子',
        debugShowCheckedModeBanner: false,
        home: StartPage(),
      ),
    );
  }
}