import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';


//获取works内容
Future getWorksContent() async{
  try {
    print ('开始获取作品内容');
    Response response;
    Dio dio = new Dio();
    response = await dio.post(works_url);
    if(response.statusCode==200){
      return print(response.data);
    }else{
      throw Exception('后端接口异常');
    }
  } catch (e) {
    return print('ERROR ==========>${e}');
  }
}

//通用方法
Future request(url,{formData}) async{
  try {
    print('开始获取数据');
    Response response;
    Dio dio = new Dio();
    if(formData==null){
      response = await dio.post(url);
    }else{
      response = await dio.post(url,data:formData);
    }
    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}
