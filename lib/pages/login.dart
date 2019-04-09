import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'register.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
//账号密码的控制器
  TextEditingController userController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  //账号密码的焦点控制器
  FocusNode user_focusNode = new FocusNode();
  FocusNode pwd_focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("登陆",style: TextStyle(color: Color(0xFF4A4A4A)),),
        backgroundColor: Color(0xFFF9F9F9),
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Color(0xFF4A4A4A),
        ),
      ),
      body: Login_body(),
    );
  }
  


  Widget Login_body(){
    return SingleChildScrollView(
        child: Container(
          width: ScreenUtil().setWidth(750),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Login_title(),
              Login_icon(),
              Edit_username(),
              Edit_password(),
              Login_button(),
              Register_button(),
            ],
          ),
        )
      );
  }

  Widget Login_title(){
    return Container(
      height: ScreenUtil().setHeight(50),
      margin: EdgeInsets.only(top:20),
      child: Text(
        "Welcome to JinJianZi",
        style: TextStyle(
          fontSize: ScreenUtil().setSp(40),
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      )
    );
  }

  Widget Login_icon(){
    return Container(
      width:ScreenUtil().setWidth(300),
      height: ScreenUtil().setHeight(300),
      margin: EdgeInsets.only(top:20),
      child: Image.asset(
        "assets/login/icon.png",
        fit: BoxFit.cover,
        ),
    );
  }

  Widget Edit_username(){
    return Container(
      width: ScreenUtil().setWidth(630),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12,
      ),
      child: TextField(
          controller: userController,
          focusNode: user_focusNode,
          maxLines: 1,
          decoration: InputDecoration(
          prefixIcon:Icon(Icons.person),
          hintText: '用户名',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget Edit_password(){
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: ScreenUtil().setWidth(630),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12,
      ),
      child: TextField(
        controller: pwdController,
        focusNode: pwd_focusNode,
        maxLines: 1,
        decoration: InputDecoration(
          prefixIcon:Icon(Icons.lock),
          hintText: '密码',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget Login_button(){
    return Container(
      width: ScreenUtil().setWidth(600),
      margin: EdgeInsets.only(top:20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: RaisedButton(
        onPressed: (){},
        child: Text("登陆"),
        textColor: Colors.white,
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
      ),
    );
  }

  Widget Register_button(){
    return Container(
      margin: EdgeInsets.only(top:20),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            new MaterialPageRoute(
            builder: (BuildContext context){
            return Register();
                }
              ),
            );
        },
        child: Text(
          "免费注册",
          style: TextStyle(
            color: Colors.grey,
            decoration: TextDecoration.underline,
            decorationColor:Colors.grey
          ),
        ),
      ),
    );
  }

}