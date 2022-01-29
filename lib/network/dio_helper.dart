import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://retail.amit-learning.com/api/',
        receiveDataWhenStatusError: true,
      )
    );
  }
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,

  })async
  {
    dio.options.headers =
    {
      'Content-Type':'application/json',

    };
    return await dio.get(
      url,
      queryParameters: query ,

    );
  }
}