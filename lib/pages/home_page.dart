import 'package:flutter/material.dart';
import 'home_childpages.dart/appbar_ui.dart';
import 'home_childpages.dart/home_content..dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print('HomePage initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadWidget(),
        backgroundColor: Colors.white,
      ),
      body: HomeContent(),
    );
  }

}



