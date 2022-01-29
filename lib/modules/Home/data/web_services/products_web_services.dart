// import 'package:dio/dio.dart';
//
// class ProductsWebServices{
//   late Dio dio;
//
//   ProductsWebServices(){
//     BaseOptions options =BaseOptions(
//       baseUrl: 'https://retail.amit-learning.com/api/products',
//       receiveDataWhenStatusError: true,
//       connectTimeout: 20*1000,
//       receiveTimeout: 20*1000,
//     );
//     dio=Dio(options);
//   }
//   Future<List<dynamic>>getAllProducts()async{
//     try{
//       Response response =await dio.get('path')
//     }catch(e){
//       print(e.toString());
//       return [];
//     }
//     }
//
// }