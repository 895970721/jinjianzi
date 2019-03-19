import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class message extends StatefulWidget {
  @override
  _messageState createState() => _messageState();
}

class _messageState extends State<message> with SingleTickerProviderStateMixin{
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
        title: new Text('消息'),
        bottom: new TabBar(
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.favorite),
              text: '我的收藏',
            ),
            new Tab(
              icon: new Icon(Icons.thumb_up),
              text: '谁赞了我',
            ),
            new Tab(
              icon: new Icon(Icons.chat_bubble),
              text: '谁评论我',
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