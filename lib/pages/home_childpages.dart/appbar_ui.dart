import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_host_search.dart';


//appbar部件
  Widget HeadWidget(){
    return Container(
      child: Column(
        children: <Widget>[
          HomeTitle(),
          HomeSearch(),
        ],
      ),
    );
  }
  
class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
          return HostSearch();
        }));
      },
      child: Container(
        height: ScreenUtil().setHeight(50),
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Color.fromRGBO(238, 233, 233, 1.0)
          ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Icon(
                  Icons.search,
                  color: Color.fromRGBO(139,137,137,1.0),
                ),
                Text(
                  '大家都在搜',
                  style: TextStyle(
                    fontSize:14,
                    color: Color.fromRGBO(139,137,137,1.0),
                    letterSpacing: 2,
                    fontStyle: FontStyle.normal
                    )
                  )
                ],
            ),
      ),
    );
  }
}

//HomeTitle
class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '发现',
        style: TextStyle(
          color:Colors.black ,
          fontSize: 17,
          decoration: TextDecoration.underline,
          decorationColor:Colors.red
        ),
      ),
    );
  }
}
