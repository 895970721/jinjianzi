import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../../config/service_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home_details extends StatefulWidget {
  Home_details({Key key,this.works_id}):super(key:key);
  int works_id;
  Home_detailsState createState() => Home_detailsState();
}

class Home_detailsState extends State<Home_details> {

  @override
  void initState() { 
    super.initState();
    id = widget.works_id;
  }

  var id;
  

  @override
  Widget build(BuildContext context) {
    FormData formData = new FormData.from({
      'work_id':id
    });
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Text(
              "发现",
              style: TextStyle(
                color:Colors.black,
                fontSize: ScreenUtil().setSp(30)
                ),
              ),
          ),
          backgroundColor: Color(0xFFF9F9F9),
          centerTitle: true,
          elevation: 0.5,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Color(0xFF4A4A4A),
          ),
      ),
      body:FutureBuilder(
        future: request(work_url,formData:formData),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List Data = snapshot.data;
            return Detail_body(Data);
          }else{
            return Center(
              child: Text('加载中'),
            );
          }
        }
      )
    );
  }

  Widget Detail_body(list){
    return Container(
        child: Column(
         children: <Widget>[
           Container(
             height: ScreenUtil().setHeight(100),
             alignment: Alignment.center,
             child: Text(
                list[0]['works_title'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize:ScreenUtil().setSp(30),
                  fontStyle: FontStyle.italic
                  ),
              ),
           ),
           Container(
             width: ScreenUtil().setWidth(750),
             child: Image(
               image: NetworkImage(list[0]['img_url']),
               fit: BoxFit.fill,
               ),
           ),
           Container(
             height: ScreenUtil().setHeight(200),
             padding: EdgeInsets.fromLTRB(10,10,0,0),
             child: Text(
               list[0]['content'],
               maxLines: 3,
               overflow: TextOverflow.ellipsis,
               style: TextStyle(
                 fontSize: ScreenUtil().setSp(25)
              ),
            ),
           ),
           Container(
             height: ScreenUtil().setHeight(100),
             child: Row(
               children: <Widget>[
                 Icon(Icons.favorite_border),
                 Text(list[0]["good_number"].toString()),
               ],
             )
           )
         ],
        )
      );
  }
}