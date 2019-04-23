import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../../config/service_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home_details extends StatefulWidget {
  Home_details({Key key,this.works_id,this.user_id}):super(key:key);
  int works_id;
  int user_id;
  Home_detailsState createState() => Home_detailsState();
}

class Home_detailsState extends State<Home_details> {

  var id;
  List detail_list = [];
  bool flag = false;

  String username='';
  int user_id;
  @override
  void initState() { 
    super.initState();
    id = widget.works_id;
    user_id = widget.user_id;
    if(user_id!=null){
      isLike();
    }
  }

  void isLike()async{
    FormData formData = new FormData.from({
      'user_id':user_id,
      'work_id':id,
    });
    await request(isLike_url,formData: formData).then((val){
      List data = val;
      if(data.length==0){
        flag = false;
      }else{
        flag = true;
      }
    });
  }

  void add_like()async{
    if(user_id!=null){
      FormData formData = new FormData.from({
        'user_id':user_id,'work_id':id
      });
      await request(add_like_url,formData:formData);
    }
  }

  void cancel_like()async{
    if(user_id!=null){
      FormData formData = new FormData.from({
        'user_id':user_id,'work_id':id
      });
      await request(remove_like_url,formData:formData);
    }
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) =>  AlertDialog(
        content: Text('确定离开吗'),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.of(context).pop(true);
              if(flag==true){
                add_like();
              }else{
                cancel_like();
              }
            },
            child:Text('Yes'),
          ),
          FlatButton(
            onPressed: (){
              Navigator.of(context).pop(false);
            },
            child: Text('No'),
        ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FormData formData = new FormData.from({
      'work_id':id
    });
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
              detail_list = snapshot.data;
              return Detail_body(detail_list);
            }else{
              return Center(
                child: Text('加载中'),
              );
            }
          }
        )
      ),
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
             margin: EdgeInsets.only(left: 350),
             height: ScreenUtil().setHeight(100),
             child: Row(
               children: <Widget>[
                 InkWell(
                   onTap: (){
                     setState(() {
                       flag = !flag;
                     });
                   },
                   child: Icon(
                      Icons.favorite_border,
                      color: (flag==true)?Colors.red:Colors.black
                    ),
                 ),
                 Text(list[0]["good_number"].toString()),
               ],
             )
           )
         ],
        )
      );
  }
}