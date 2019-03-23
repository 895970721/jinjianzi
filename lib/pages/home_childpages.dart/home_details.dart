import 'package:flutter/material.dart';

class home_details extends StatefulWidget {
  _home_detailsState createState() => _home_detailsState();
}

class _home_detailsState extends State<home_details> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: <Widget>[
           Container(
             child: Text(""),
           ),
           Container(
             child: Image(
               image: NetworkImage(""),
               fit: BoxFit.fill,
               ),
           ),
           Container(
             child: Text(""),
           ),
         ],
       )
    );
  }
}