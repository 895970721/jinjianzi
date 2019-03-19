import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorPage extends StatelessWidget {
 @override
    Widget build(BuildContext context) {
      return Container(
        child: Column(
          children: <Widget>[
            circleview(),//圈圈网格
            TabBarDemoState(), //导航
          ],
        ),
      );
    }
  }



//圈圈网格
class circleview extends StatefulWidget {
  @override
  _circleviewState createState() => _circleviewState();
}

class _circleviewState extends State<circleview> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      margin: EdgeInsets.only(bottom: 0.0),
      height: ScreenUtil().setHeight(400),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:30,left: 35),
          child:
       new FloatingActionButton(
           onPressed: () {},
           foregroundColor: Colors.white,
           backgroundColor: Color(0xFFf19670),
           child: Text("洗发"),
           heroTag: null,
       )
       ),
       Expanded(
         child:
         Container(
           margin: EdgeInsets.only(top:30,left: 40),
         child:
        new FloatingActionButton(
           onPressed: () {},
           foregroundColor: Colors.white,
           backgroundColor: Color(0xFFf19670),
           child: new Text("吹发"),
           heroTag: null,
       )
       )
       ),
       Expanded(
         child:
         Container(
           margin: EdgeInsets.only(top:30,left: 40,right: 35),
           child:
       new FloatingActionButton(
           onPressed: () {},
           foregroundColor: Colors.white,
           backgroundColor: Color(0xFFf19670),
           child: new Text("护理"),
           heroTag: null,
       )
       )
       ),
     ],
      ),
      Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:0,left: 35),
          child:
       new FloatingActionButton(
           onPressed: () {},
           foregroundColor: Colors.white,
           backgroundColor: Color(0xFFf19670),
           child: new Text("盲区"),
           heroTag: null,
       )
       ),
       Expanded(
         child:
         Container(
           margin: EdgeInsets.only(top:0,left: 40),
         child:
        new FloatingActionButton(
           onPressed: () {},
           foregroundColor: Colors.white,
           backgroundColor: Color(0xFFf19670),
           child: new Text("造型"),
           heroTag: null,
       )
       )
       ),
       Expanded(
         child:
         Container(
           margin: EdgeInsets.only(top:0,left: 40,right: 35),
           child:
       new FloatingActionButton(
           onPressed: () {},
           foregroundColor: Colors.white,
           backgroundColor: Color(0xFFf19670),
           child: new Text("黑店"),
           heroTag: null,
       )
       )
       ),
     ],
      ),]
      )
    );
  }
}


//中间部分的导航
class TabBarDemoState extends StatefulWidget {
  @override
  _TabBarDemoStateState createState() => _TabBarDemoStateState();
}

class _TabBarDemoStateState extends State<TabBarDemoState> with SingleTickerProviderStateMixin{
  
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
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      height: ScreenUtil().setHeight(805),
      child:
    new ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
          new Container(
          margin: EdgeInsets.only(top:0),
          height: ScreenUtil().setHeight(120),
          decoration: new BoxDecoration(
          border: new Border.all(width: 2.0, color: Colors.black12),
          ),
          child:
          new TabBar(
          labelColor: Colors.black,
          tabs: <Widget>[
            new Tab(
              text: '最新'
            ),
            new Tab(
              text: '最热'
            ),
            new Tab(
              text: '我要发布'
            ),
          ],
        controller: _tabController,
        )
        ),

       new Container(
        height: ScreenUtil().setHeight(650),
        child:
        new TabBarView(
        controller: _tabController,
        children: <Widget>[
           new Center(child: new Text('自行车')),
           new Center(child: new Text('自行车')),
           new Center(child: new Text('自行车')),
        ],
      ),
      )
      ]
      )
      );
  }
}