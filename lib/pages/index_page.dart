import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'found_page.dart';
import 'message_page.dart';
import 'my_page.dart';
import 'add_page.dart';
import 'login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bus/event_bus.dart';


class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int currentIndex=0;//当前页面的索引
  var currentPage;//当前页面
  String username='';

  //重写init方法
  @override
  void initState() { 
    currentPage=tabBodies[currentIndex];
    super.initState();
  }
  ////保存页面的数组
  List<Widget> tabBodies = [
    HomePage(),
    found(),
    message(),
    person(),
  ];
  
  ///保存底部导航栏组件
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon:Icon(
        CupertinoIcons.home,
        color: Colors.grey,
      ),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon:Icon(
        CupertinoIcons.search,
        color: Colors.grey,
      ),
      title: Text('发现')
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.message,
        color: Colors.grey,
        ),
      title: Text('消息')
    ),
    BottomNavigationBarItem(
      icon:Icon(
        CupertinoIcons.profile_circled,
        color: Colors.grey,
        ),
      title: Text('我')
    )
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      floatingActionButton: FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      )
    );
  }
  //浮动圆形
  Widget FAB(){
    return FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return Edit();
          }));
        },
        child: Icon(
          Icons.add,
          color:Colors.white
        ),
    );
  }

  //底部导航栏
  Widget BottomBar(){
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        fixedColor: Colors.black,
        onTap: (index){
          if(index==3){
            if(username==''){
              Navigator.push<String>(context, new MaterialPageRoute(builder: (BuildContext context){
                return Login();
              })).then((String result){
                setState(() {
                  username = result;
                  eventBus.fire(new UserLoggedInEvent(username));
                });
              });
            }
          };
          setState(() {
            currentIndex =index;
            currentPage =tabBodies[currentIndex]; 
          });
        },
      );
  }

}

