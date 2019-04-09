import 'package:flutter/material.dart';
import './login.dart';

class person extends StatefulWidget {
  @override
  _personState createState() => _personState();
}

class _personState extends State<person> with SingleTickerProviderStateMixin{
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
        backgroundColor:Colors.white,
        title: top_bar(),
        bottom: tab_bar()
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Center(child: new Text('自行车')),
          new Center(child: new Text('船')),
          new Center(child: new Text('巴士')),
        ],
      ),
    );
  }

  Widget top_bar(){
    return Container(
      child: Center(
        child: InkWell(
          child: Text(
            "未登陆",
            style: TextStyle(
              color: Colors.black
            ),
          ),
          onTap: (){
            Navigator.push(
            context,
            new MaterialPageRoute(
            builder: (BuildContext context){
            return Login();
                }
              ),
            );
          },
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