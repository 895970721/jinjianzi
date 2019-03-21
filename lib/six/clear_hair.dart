import 'package:flutter/material.dart';

class clear_hair extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Text('洗发技巧'),),
      body: Center(
        child: MyListView(items: new List<String>.generate(100, (i)=> "Item $i")),
          ),
          );
  }
}

class MyListView extends StatelessWidget {
  //设置属性，用来接收外部参数， final 参数类型，参数名
  final List<String> items;
  //以下是构造函数，固定语法
  MyListView({Key key, @required this.items}):super(key:key);
 
  @override
  Widget build(BuildContext context){
    
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context,index){
        return ListTile(
          leading: Icon(Icons.access_alarm),
          title: Text("列表标题是${items[index]}"),
        );
      },
    );
 
  }
}

