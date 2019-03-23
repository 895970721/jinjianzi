import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../service/service_method.dart';
import '../../config/service_url.dart';

class HomeContent extends StatefulWidget {
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>{

  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

  void initState() { 
    super.initState();
    _getWorksList();
  }

  var workslist =[];

  @override
  Widget build(BuildContext context) {
    workslist.toString();
    List<Map> workList = (workslist as List).cast();
    return Container(
       child: EasyRefresh(
         child: GridView.builder(
          padding:EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0
          ),
            itemCount: workList.length,
            itemBuilder:(context,index){
              return WorksItem(workList,index);
          }
        ),
        loadMore: ()async{
          print('开始加载更多');
          await request(works_url).then((val){
            var data =val;
            setState(() {
              workslist.addAll(data);
            });
          });
        },
        refreshFooter: ClassicsFooter(
                key:_footerKey,
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
  Widget WorksItem(workList,index){
  return InkWell(
    onTap: (){},
    child: Container(
      width: ScreenUtil().setWidth(350),
      height: ScreenUtil().setHeight(400),
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(350),
            height: ScreenUtil().setHeight(285),
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage(workList[index]['img_url']),
            )
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
            workList[index]['content'],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize:ScreenUtil().setSp(24),
              ),
            ),
          ),
          _Bottom(workList,index),
        ],
      ),
    ),
  );
}

Widget _Bottom(workList,index){
  return Container(
    padding: EdgeInsets.only(left:5.0),
    child: Row(
      children: <Widget>[
        Text(
          workList[index]['nick_name'],
          style: TextStyle(fontSize:ScreenUtil().setSp(23)),
        ),
        Container(
          padding: EdgeInsets.only(left: 110),
          child: Row(
            children: <Widget>[
              Container(
                child:Icon(
                  Icons.favorite_border,
                  size: 14,
                ),
              ),
              Text(
                workList[index]['good_number'].toString()
                ),
            ],
          ),
        ),
      ],
    ),
  );
}

  void _getWorksList() async{
    await request(works_url).then((val){
      var data = val;
      setState(() {
       workslist = data;
      });
    });
  }

}




