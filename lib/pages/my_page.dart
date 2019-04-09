import 'package:flutter/material.dart';

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
        backgroundColor:Colors.black,
        title: new Center(child: new Text('小小泽泽')),
        bottom: new TabBar(
          indicatorColor: Colors.white,
          unselectedLabelStyle: TextStyle(fontSize: 12.0),
          labelStyle: new TextStyle(fontSize: 16.0),
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.account_circle),
              text: '资料',
            ),
            new Tab(
              icon: new Icon(Icons.visibility),
              text: '关注',
            ),
            new Tab(
              icon: new Icon(Icons.supervised_user_circle),
              text: '粉丝',
            ),
          ],
          controller: _tabController,
        ),
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
}