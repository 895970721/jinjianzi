import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_method.dart';
import '../config/service_url.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class tool_hair extends StatefulWidget {
  @override
  _tool_hairState createState() => _tool_hairState();
}

class _tool_hairState extends State<tool_hair> {
 
    GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

    void initState() { 
      super.initState();
      _getWorksList();
    }
   
    var list=[];
  @override
  Widget build(BuildContext context){
     ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    list.toString();
     List<Map> workList = (list as List).cast();
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Text('吹发技巧'),),
      body: EasyRefresh(
      child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context,index){
        return Container(
          width: ScreenUtil().setWidth(800),
          height: ScreenUtil().setHeight(1000),
          child:
          Container(
          child:
          Scaffold(
          body:
          Container(
            child:Column(
              children: <Widget>[
            Row(
              children: <Widget>[
              touxiang(workList, index),
              name(workList,index),
              ],
              ),
              //放置具体描述和图片
              texts(workList,index),
              Row(
              children: <Widget>[
              images(workList,index),
              ],
              ),
            ]
          ) 
         ),
          ),
        ),
        decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1),
                ),
        );
        
      },
    ),
     loadMore: ()async{
          print('开始加载更多');
          await request(works_url).then((val){
            var data =val;
            setState(() {
              list.addAll(data);
            });
          });
        },
        refreshFooter: ClassicsFooter(
                key: _footerKey,
                bgColor:Colors.white,
                textColor: Colors.pink,
                moreInfoColor: Colors.pink,
                showMore: true,
                noMoreText: '',
                moreInfo: '加载中',
                loadReadyText:'上拉加载....'
              ),
        
      )
    );
  }

    //用户头像
    Widget touxiang(workList,index){
    return Container( 
        margin: EdgeInsets.only(left: 10,top: 10),
        width: ScreenUtil().setWidth(100),
        height: ScreenUtil().setHeight(100),
        child:
        Image(
        image: NetworkImage(workList[index]['img_url'])
        )
    );
   
  }

  //用户名
  Widget name(workList,index){
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: new Text(
        workList[index]['nick_name'],
        style: new TextStyle(
          fontSize: 16.0,
          color: Colors.pink[400],
        ),
        )
    );
  }
  
  //具体描述
  Widget texts(workList,index){
    return Container(
      margin: EdgeInsets.only(left: 60,top: 0),
      child:Text(workList[index]['content']),
    );
  }

  //图片描述
  Widget images(workList,index){
    return Container(
      margin: EdgeInsets.only(left: 60,top: 10),
      width: ScreenUtil().setWidth(400),
      height: ScreenUtil().setHeight(400),
      child: 
      Image(
        image: NetworkImage(workList[index]['img_url'])
        )
    );
  }

  void _getWorksList() async{
    await request(works_url).then((val){
      var data = val;
      setState(() {
       list = data;
       print(data);
      });
    });
  }

}

