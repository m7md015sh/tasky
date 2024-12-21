import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky/core/errors/failures.dart';
import 'package:tasky/core/services/api_services.dart';
import 'package:tasky/features/auth/data/models/login_model.dart';
import 'package:tasky/features/auth/data/models/register_model.dart';
import 'package:tasky/features/auth/data/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final ApiService apiService;

  AuthRepoImp(this.apiService);
  @override
  Future<Either<Failure, LoginModel>> login(
      String phone, String password) async {
    try {
      var data = await apiService.post(
        endPoint: 'auth/login',
        data: {
          'phone': phone,
          'password': password,
        },
      );
      final loginModel = LoginModel.fromMap(data);
      return Right(loginModel);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register(
      String phone,
      String password,
      String displayName,
      int experienceYears,
      String address,
      String level) async {
    try {
      var data = await apiService.post(
        endPoint: 'auth/register',
        data: {
          'phone': phone,
          'password': password,
          'displayName': displayName,
          'experienceYears': experienceYears,
          'address': address,
          'level': level,
        },
        headers: {
          'Content-Type': 'application/json',
        },
      );
      final signupModel = RegisterModel.fromMap(data);

      return Right(signupModel);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure.fromDioError(error));
      }

      return Left(ServerFailure(error.toString()));
    }
  }
}
