import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../service/service_method.dart';
import '../config/service_url.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //验证是否通过变量
  String ifsuccess = '';

  TextEditingController r_user_Controller = TextEditingController();
  TextEditingController r_pwd_Controller = TextEditingController();
  TextEditingController r_name_Controller = TextEditingController();
  TextEditingController r_sex_Controller = TextEditingController();

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
            Register_body(),
          ],
        ),
      )
     ),
    );
  }

  Widget Register_body(){
    return Container(
      width: ScreenUtil().setWidth(630),
      child: Column(
        children: <Widget>[
          Container(
            child:TextField(
              controller: r_user_Controller,
              maxLines: 1,
              autofocus: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon:Icon(Icons.person),
                labelText: '请输入用户名',
              ),
            ),
          ),
          Container(
            child: TextField(
            controller: r_pwd_Controller,
            maxLines: 1,
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon:Icon(Icons.lock),
              labelText: '请输入密码',
              ),
            ),
          ),
          Container(
            child:TextField(
              controller: r_name_Controller,
              maxLines: 1,
              autofocus: false,
              decoration: InputDecoration(
                prefixIcon:Icon(Icons.person),
                labelText: '请输入昵称',
              ),
            ),
          ),
          Container(
            child:TextField(
              controller: r_sex_Controller,
              maxLines: 1,
              autofocus: false,
              decoration: InputDecoration(
                prefixIcon:Icon(Icons.person),
                labelText: '请输入性别',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: RaisedButton(
              onPressed: (){
                _register();
              },
              child: Text('注册'),
            ),
          ),
        ],
      )
    );
  }

  void _register() async{
    String username = r_user_Controller.text;
    String password = r_pwd_Controller.text;
    String nick_name = r_name_Controller.text;
    String sex = r_sex_Controller.text;
    await _verify(username,password,nick_name,sex);
    if(ifsuccess=='存在用户名'){
      Fluttertoast.showToast(
        msg: "存在用户名",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }else{
      Fluttertoast.showToast(
        msg: "注册成功",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0
      );
      Navigator.of(context).pop();
      ifsuccess = '';
    }
  }

  void _verify(String username,String password,String nick_name,String sex)async{
    FormData formData = new FormData.from({
      'username':username,
      'password':password,
      'nick_name':nick_name,
      'sex':sex,
    });
    await request(register_url,formData:formData).then((val){
      var data = val;
      ifsuccess = data;
    });
  }
}