import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

  class person extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Container(
        child: Column(
          children: <Widget>[
            person1(),//第一列
            person2(),//第二列
            TabBarDemoState(),//导航
          ],
        ),
      );
    }
  }



//第一列
class person1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          headpicture(),      //头像部分
          trends(),           //关注，粉丝，收藏部分
        ],
      
      )
      
    );
  }
}


//第二列
class person2 extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      margin: EdgeInsets.only(top:5.0,left: 80.0),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(383),
            child:OutlineButton(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: new Text('个人资料'),
          onPressed: (){},
          ),
          
          ),
         
         OutlineButton(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
           child: new Text('设置'),
           onPressed: (){},
         ),
        ],
      ),
    );
    
  }
}


//头像部分
class headpicture extends StatefulWidget {
  @override
  _headpicture createState() => _headpicture();
}

class _headpicture extends State<headpicture> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setHeight(100),
      margin: EdgeInsets.only(top: 50.0,left: 15.0),
      child: Row(
        children: <Widget>[
          new ClipOval(
            //头像图片需要后台传
          child:new  Image.network('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3393402233,2133215865&fm=27&gp=0.jpg',scale: 2.0)
          )
        ],
      ),
      
    );
  }
}

//关注，粉丝，收藏
class trends extends StatefulWidget {
  @override
  _trendsState createState() => _trendsState();
}

class _trendsState extends State<trends> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(60),
      margin: EdgeInsets.only(top: 50.0,left: 5.0),
     child: Row(
       children: <Widget>[
         FlatButton(
           child: new Text('关注'),
           onPressed: (){},
         ),

         FlatButton(
           child: new Text('粉丝'),
           onPressed: (){},
         ),

         FlatButton(
           child: new Text('收藏'),
           onPressed: (){},
         ),
       ],
     ),
    );
  }
}

//个人资料按钮
class information extends StatefulWidget {
  @override
  _informationState createState() => _informationState();
}

class _informationState extends State<information> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(50),
      child: Row(
        children: <Widget>[
          FlatButton(
           child: new Text('个人资料'),
           onPressed: (){},
         ),
        ],
      ),
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
      margin: EdgeInsets.only(top: 0),
      height: ScreenUtil().setHeight(873),
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
              text: '赞过'
            ),
            new Tab(
              text: '评论'
            ),
            new Tab(
              text: '私信'
            ),
          ],
        controller: _tabController,
        )
        ),

       new Container(
         margin: EdgeInsets.only(top: 0),
        height: ScreenUtil().setHeight(700),
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