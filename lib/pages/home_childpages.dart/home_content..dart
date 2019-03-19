import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class home_content extends StatefulWidget {
  _home_contentState createState() => _home_contentState();
}

class _home_contentState extends State<home_content> {

  List<Map> workList;

  @override
  Widget build(BuildContext context) {
    return Container(
       child: EasyRefresh(
         child: ListView(
           children: <Widget>[
           ],
         ),
       )
    );
  }
}

Widget worksItem(){
  return InkWell(
    onTap: (){},
    child: Container(
      width: ScreenUtil().setWidth(350),
      padding: EdgeInsets.all(5.0),
      margin:EdgeInsets.only(bottom:3.0),
      child: Column(
        children: <Widget>[
          Image.network('https://jspang.com/static//myimg/blogtouxiang.jpg'),
          Text(
            '不同于小卷烫发的灵动活泼，大卷烫发更讲究的是成熟与气场，让女生看上去更加落落大方。常见的大卷烫发发型有偏分大卷烫发、空气刘海大卷烫发、欧美风大卷烫发、韩式大卷烫发、个性大卷烫发、露额大卷烫发、凌乱感大卷烫发、大卷烫发半扎发',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize:ScreenUtil().setSp(26)),
          )
        ],
      ),
    ),
  );
}

Widget twoworks(){
  return Row(
    children: <Widget>[],
  );
}

