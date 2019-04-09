import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("账号注册",style: TextStyle(color: Color(0xFF4A4A4A)),),
        backgroundColor: Color(0xFFF9F9F9),
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Color(0xFF4A4A4A),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
        width: ScreenUtil().setWidth(750),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Register_username(),
            /*Register_password(),
            Register_nick_name(),
            Register_sex(),
            Register_buttton(),*/
          ],
        ),
      )
     ),
    );
  }

  Widget Register_username(){
    return Container(
      width: ScreenUtil().setWidth(630),
      decoration: BoxDecoration(
        border:Border(bottom:BorderSide(width: 1.0)),
        color: Color(0xFFF9F9F9),
      ),
      child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
          prefixIcon:Icon(Icons.person),
          hintText: '请输入用户名',
          border: InputBorder.none,
        ),
      ),
    );
  }


}