import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService{
  final String _baseUrl = "https://todo.iraqsapp.com/";
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String,dynamic>>get({required String endPoint}) async{
    var response= await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String,dynamic>>post({required String endPoint,required Map<String,dynamic> data, Map<String,String>? headers}) async{
    var response= await _dio.post('$_baseUrl$endPoint',data: jsonEncode(data),options: Options(headers: headers));
    return response.data;
  }
  Future<Map<String,dynamic>>edit({required String endPoint}) async{
    var response= await _dio.put('$_baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String,dynamic>>delete({required String endPoint}) async{
    var response= await _dio.delete('$_baseUrl$endPoint');
    return response.data;
  }
}