import 'package:dio/dio.dart';

import 'api_constant.dart';

class DioHelper{
  static  Dio? dio;
  static init(){
  dio=  Dio(
      //https://api.nytimes.com/svc/books/v3/lists/current/health.json?api-key=ttztqJa96psTzSJTBfZGegDKk6PKat0D
      BaseOptions(
        baseUrl: ApiConstant.BASE_URL,
        receiveDataWhenStatusError: true
      )
    );
  }
  static Future<Response> GetData({
  required String url,
})async{
    return await dio!.get(url);
  }
}