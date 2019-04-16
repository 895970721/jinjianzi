import 'package:flutter/material.dart';
import '../bus/event_bus.dart';
import '../service/service_method.dart';
import '../config/service_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class person extends StatefulWidget {
  @override
  _personState createState() => _personState();
}

class _personState extends State<person> with SingleTickerProviderStateMixin{
  TabController _tabController;
  String username = '';
  void _listen(){
    eventBus.on<UserLoggedInEvent>().listen((event){
      setState(() {
        username = event.text;
      });
    });
  }


 @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _listen();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    if(username!=''){
      FormData formData = new FormData.from({
        'username':username
      });
      return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.white,
          title: top_bar(),
          bottom: tab_bar()
        ),
        body: FutureBuilder(
          future: request(user_info_url,formData: formData),
          builder: (context,snapshot){
            switch (snapshot.connectionState){
              case ConnectionState.done:
                List list = snapshot.data;
                if(snapshot.hasData) return tab_body(list);
                break;
              default:
                return Center(child: Text("加载中....."),);
            }
          }
        )
      );      
    }else{
      return Center(
        child: Text('您还未登陆,正在进入登陆页'),
      );
    }
  }

 Widget tab_body(List list){
   return TabBarView(
    controller: _tabController,
    children: <Widget>[
      new Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(700),
            margin: EdgeInsets.only(top:15),
            decoration:BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.1)),
              color: Colors.white
            ),
            child: Text(
              "账号:   ${list[0]['username']}",
              style: TextStyle(
                fontSize: 27
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(700),
            margin: EdgeInsets.only(top:5),
            decoration:BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.1)),
              color: Colors.white
            ),
            child: Text(
              "密码:   ${list[0]['password']}",
              style: TextStyle(
                fontSize: 27
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(700),
            margin: EdgeInsets.only(top:5),
            decoration:BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.1)),
              color: Colors.white
            ),
            child: Text(
              "昵称:   ${list[0]['nick_name']}",
              style: TextStyle(
                fontSize: 27
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(700),
            margin: EdgeInsets.only(top:5),
            decoration:BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.1)),
              color: Colors.white
            ),
            child: Text(
              "性别:   ${list[0]['sex']}",
              style: TextStyle(
                fontSize: 27
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(700),
            margin: EdgeInsets.only(top:5),
            decoration:BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.1)),
              color: Colors.white
            ),
            child: Text(
              "粉丝数:   ${list[0]['fans_number']}",
              style: TextStyle(
                fontSize: 27
              ),
            ),
          ),
        ],
      ),
      new Center(child: new Text('无')),
      new Center(child: new Text('无')),
    ],
  );
}

  Widget top_bar(){
    return Container(
      child: Center(
        child: InkWell(
          child: Text(
            '首页',
            style: TextStyle(
              color: Colors.black
            ),
          ),
        ),
      ),
    );
  }

  Widget tab_bar(){
    return new TabBar(
          indicatorColor: Colors.red,
          unselectedLabelStyle: TextStyle(fontSize: 12.0),
          labelStyle: new TextStyle(fontSize: 16.0),
          tabs: <Widget>[
            new Tab(
              icon: new Icon(
                Icons.account_circle,
                color: Colors.blue,
                ),
              child: Text(
                "资料",
                style: TextStyle(
                  color: Colors.black
                  ),
                ),
            ),
            new Tab(
              icon: new Icon(
                Icons.visibility,
                color: Colors.green,
                ),
              child: Text(
                "收藏",
                style: TextStyle(
                  color: Colors.black
                  ),
                ),
            ),
            new Tab(
              icon: new Icon(
                Icons.favorite_border,
                color: Colors.red,
                ),
              child: Text(
                "赞过",
                style: TextStyle(
                  color: Colors.black
                  ),
                ),
            ),
          ],
          controller: _tabController,
        );
  }
}