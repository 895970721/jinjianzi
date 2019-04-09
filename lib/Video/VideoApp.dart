import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import '../service/service_method.dart';
import '../config/service_url.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class video extends StatefulWidget {
  @override
  _videoState createState() => _videoState();
}

class _videoState extends State<video> {
 
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
              Video()//视频内容
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
      margin: EdgeInsets.only(left: 10,top: 0,bottom: 10),
      child:Text(workList[index]['content']),
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






List videolist = [VideoPlayerController.network
('https://flv2.bn.netease.com/videolib3/1803/14/fFiVq8733/SD/fFiVq8733-mobile.mp4'),
VideoPlayerController.network
('http://mp4.videoshijie.com/dIauxdz3fMtSuAkYq_3Zj3PXJpM%3D%2Fln5is9Q1iPKSJ_HpfTdIu4RIpDQZ'),
VideoPlayerController.network
('http://mp4.videoshijie.com/dIauxdz3fMtSuAkYq_3Zj3PXJpM%3D%2FltUreW6cDBZnHpp1PoNsNIoUWqT2'),
];





var count=videolist.length;

   final chewieController = ChewieController(
      videoPlayerController:function(),
            aspectRatio: 4/3,
            autoPlay: false,
            looping: false,
            autoInitialize: true,
            allowedScreenSleep: true,
            isLive: false,
         );
      
      function(){
        ListView.builder(
        itemCount: videolist.length,
        itemBuilder: (BuildContext context, int index) {
        return videolist[index];
      },
    );
  }
  


// //视频方法
// final videoPlayerController = VideoPlayerController.network
// ('https://flv2.bn.netease.com/videolib3/1803/14/fFiVq8733/SD/fFiVq8733-mobile.mp4');

// final chewieController = ChewieController(
//   videoPlayerController:videolist[1],
//   aspectRatio: 4/3,
//   autoPlay: false,
//   looping: false,
//   autoInitialize: true,
//   allowedScreenSleep: true,
//   isLive: false,
// );

final playerWidget =
  Chewie(
      controller: chewieController,
  );



class Video extends StatefulWidget {
  
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(745),
      child:playerWidget
    );
  }
}

