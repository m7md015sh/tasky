import 'package:dartz/dartz.dart';
import 'package:tasky/core/errors/failures.dart';
import 'package:tasky/features/auth/data/models/login_model.dart';
import 'package:tasky/features/auth/data/models/register_model.dart';
import 'package:tasky/features/auth/data/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo{
  @override
  Future<Either<Failure, LoginModel>> login(String phone, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RegisterModel>> register(String phone, String password, String displayName, int experienceYears, String address, String level) {
    // TODO: implement register
    throw UnimplementedError();
  }

}