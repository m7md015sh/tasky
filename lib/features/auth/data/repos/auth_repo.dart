import 'package:dartz/dartz.dart';
import 'package:tasky/core/errors/failures.dart';
import 'package:tasky/features/auth/data/models/login_model.dart';
import 'package:tasky/features/auth/data/models/register_model.dart';

abstract class AuthRepo {
 Future<Either<Failure,LoginModel>> login(String phone, String password);
 Future<Either<Failure,RegisterModel>>  register(String phone, String password, String displayName,
      int experienceYears, String address, String level);
}
