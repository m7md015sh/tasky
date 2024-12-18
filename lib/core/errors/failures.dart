import 'package:dio/dio.dart';

abstract class Failure {}

class ServerFailure extends Failure {
  final String error;

  ServerFailure(this.error);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection TimeOut with API server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send TimeOut with API server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive TimeOut with API server");
      case DioExceptionType.badCertificate:
        return ServerFailure("Receive Bad Certificate");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to API sever Was Canceled");
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Ops There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Ops There was an Error, Please try again');
    }
  }
}
