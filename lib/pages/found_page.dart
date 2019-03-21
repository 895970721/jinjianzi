import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../six/clear_hair.dart';
import '../six/blow_hair.dart';
import '../six/nurse_hair.dart';
import '../six/blind_hair.dart';
import '../six/model_hair.dart';
import '../six/tool_hair.dart';

class found extends StatefulWidget {
  @override
  _foundState createState() => _foundState();
}

class _foundState extends State<found> with SingleTickerProviderStateMixin{
  TabController _tabController;
 @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text('发现好东西'),),
        backgroundColor: Colors.pink,
        bottom: new TabBar(
          indicatorColor: Colors.white,
          unselectedLabelStyle: TextStyle(fontSize: 12.0),
          labelStyle: new TextStyle(fontSize: 16.0),
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.cloud),
              text: '最新',
            ),
            new Tab(
              icon: new Icon(Icons.whatshot),
              text: '最热',
            ),
            new Tab(
              icon: new Icon(Icons.pets),
              text: '我的发布',
            ),
          ],
          controller: _tabController,
        ),
      ),

      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Center(child: grid()),
          new Center(child: new Text('船')),
          new Center(child: new Text('巴士')),
        ],
      ),
    );
  }
}



class grid extends StatefulWidget {
  @override
  _gridState createState() => _gridState();
}

class _gridState extends State<grid> {
  
  @override
  Widget build(BuildContext context) {
     ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      margin: EdgeInsets.only(top: 30),
      child:Column(
        children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20),
          child:
          new FloatingActionButton(
            onPressed: (){
              print('This is first page');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => clear_hair()));
            },
            foregroundColor: Colors.black,
            backgroundColor: Colors.green[200],
            child: new Text('洗发'),
            heroTag: null,
          ),
          ),
         Container(
          child:
          new FloatingActionButton(
            onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => blow_hair()));
            },
            foregroundColor: Colors.blue,
            backgroundColor: Colors.yellow,
            child: new Text('吹发'),
            heroTag: null,
          ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
          child:
          new FloatingActionButton(
            onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => nurse_hair()));
            },
            foregroundColor: Colors.purple[400],
            backgroundColor: Colors.pink[300],
            child: new Text('护理'),
            heroTag: null,
          ),
          ),
        ],
      ),
      
      Container(
        margin: EdgeInsets.only(top: 50),
        child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20),
          child:
          new FloatingActionButton(
            onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => blind_hair()));
            },
            foregroundColor: Colors.black,
            backgroundColor: Colors.brown[300],
            child: new Text('盲区'),
            heroTag: null,
          ),
          ),
         Container(
          child:
          new FloatingActionButton(
            onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => model_hair()));
            },
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            child: new Text('造型'),
            heroTag: null,
          ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
          child:
          new FloatingActionButton(
            onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tool_hair()));
            },
            foregroundColor: Colors.black,
            backgroundColor: Colors.red,
            child: new Text('工具'),
            heroTag: null,
          ),
          ),
        ],
      )
      ),
      Container(
        margin: EdgeInsets.only(top: 50),
        child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20),
          child:
          new FloatingActionButton(
            onPressed: (){},
            foregroundColor: Colors.lightBlue,
            backgroundColor: Colors.black,
            child: new Text('待续'),
            heroTag: null,
          ),
          ),
         Container(
          child:
          new FloatingActionButton(
            onPressed: (){},
            foregroundColor: Colors.lightBlue,
            backgroundColor: Colors.black,
            child: new Text('待续'),
            heroTag: null,
          ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
          child:
          new FloatingActionButton(
            onPressed: (){},
            foregroundColor: Colors.lightBlue,
            backgroundColor: Colors.black,
            child: new Text('待续'),
            heroTag: null,
          ),
          ),
        ],
      )
      )
      ]
      )
    );
  }
}
