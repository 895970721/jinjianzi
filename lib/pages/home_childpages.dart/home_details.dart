import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../../config/service_url.dart';

class Home_details extends StatefulWidget {
  int works_id;
  Home_details({Key key, @required this.works_id}):super(key:key);
  Home_detailsState createState() => Home_detailsState();
}

class Home_detailsState extends State<Home_details> {

  @override
  void initState() { 
    super.initState();
    id = widget.works_id;
    _getWorkList();
  }

  int id = 1;
  var list = [];

  @override
  Widget build(BuildContext context) {
    List<Map> work_list = (list as List).cast();
    return Scaffold(
      appBar: AppBar(
        title: Text('发现'),
      ),
      body:Detail_body(work_list)
    );
  }

  void _getWorkList()async {
    var formData = {'work_id':id};
    await request(work_url,formData:formData).then((val){
      var data = val;
      setState(() {
        list = data;
      });
    });
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