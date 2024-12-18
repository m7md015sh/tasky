import 'package:dio/dio.dart';

class ApiService{
  final String _baseUrl = "https://todo.iraqsapp.com/";
  final Dio dio;
  ApiService(this.dio);

  Future<Map<String,dynamic>>get({required String endPoint}) async{
   var response= await dio.get('$_baseUrl$endPoint');
   return response.data;
  }

  Future<Map<String,dynamic>>post({required String endPoint}) async{
    var response= await dio.post('$_baseUrl$endPoint');
    return response.data;
  }
  Future<Map<String,dynamic>>edit({required String endPoint}) async{
    var response= await dio.put('$_baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String,dynamic>>delete({required String endPoint}) async{
    var response= await dio.delete('$_baseUrl$endPoint');
    return response.data;
  }
}