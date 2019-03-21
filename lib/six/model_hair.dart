import 'package:flutter/material.dart';

class model_hair extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Text('造型建议'),),
      body: Center(
        child: RaisedButton(
          child: Text("Go back"),
          onPressed: () {
            Navigator.pop(context);
          }),),);
  }
}