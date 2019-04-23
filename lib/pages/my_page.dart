import 'package:flutter/material.dart';
import 'package:jinjianzi/pages/home_childpages.dart/home_details.dart';
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
                List userlist = snapshot.data;
                eventBus.fire(new UserEvent(userlist[0]['user_id']));
                if(snapshot.hasData) return tab_body(userlist);
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

 Widget tab_body(List userlist){
   return TabBarView(
    controller: _tabController,
    children: <Widget>[
      info(userlist),
      new Center(child: new Text('无')),
      like_works(userlist),
    ],
  );
}

  Widget like_works(userlist){
    FormData formData = new FormData.from({
        'user_id':userlist[0]['user_id']
      });
    return FutureBuilder(
      future: request(like_works_url,formData: formData),
      builder:(context,snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.done:
            List list = snapshot.data;
            if(snapshot.hasData) return like_body(list,userlist);
            break;
          default:
            return Center(child: Text("加载中....."),);
        }
      }
    );
  }

  Widget like_body(List list,List userlist){
    return ListView.builder(
      itemCount:list.length,
      itemBuilder: (context,index){
        return like_body_item(list,index,userlist);
      }
    );
  }
  
  Widget like_body_item(list,index,userlist){
    return InkWell(
      onTap: (){
        Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context){
            return  Home_details(works_id:list[index]['works_id'],user_id:userlist[0]['user_id']);
          }
        ),
      );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
        width: ScreenUtil().setWidth(700),
        height: ScreenUtil().setHeight(250),
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(250),
              height: ScreenUtil().setHeight(250),
              child: Image.network(list[index]['img_url']),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: ScreenUtil().setWidth(450),
                    child: Text(
                      list[index]['works_title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(450),
                    child: Text(
                      list[index]['content'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: ScreenUtil().setSp(23)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(170, 10, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.favorite_border),
                        Text(list[index]["good_number"].toString()),
                      ],
                    ),
                  ),
                ],
              )
            ),
          ],
        )
      )
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

  Widget info(List list){
    return 
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
      );
  }
}