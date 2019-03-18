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
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    var formData = {'lon':'115.02932','lat':'35.76189'};
    response = await dio.post(works_url,data: formData);
    if(response.statusCode==200){
      return print(response.data);
    }else{
      throw Exception('后端接口异常');
    }
  } catch (e) {
    return print('ERROR ==========>${e}');
  }
}