import 'package:flutter/material.dart';
import 'home_childpages.dart/appbar_ui.dart';
import 'home_childpages.dart/home_content..dart';
import '../service/service_method.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadWidget(),
        backgroundColor: Colors.white,
      ),
      body: home_content(),
    );
  }
}



