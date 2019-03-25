import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../../config/service_url.dart';
import 'package:dio/dio.dart';

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
        title: Text('发现'),
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
             child: Text(list[0]['works_title']),
           ),
           Container(
             child: Image(
               image: NetworkImage(list[0]['img_url']),
               fit: BoxFit.fill,
               ),
           ),
           Container(
             child: Text(list[0]['content']),
           ),
         ],
        )
      );
  }
}