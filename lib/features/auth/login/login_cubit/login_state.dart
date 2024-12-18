part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginInvalid extends LoginState {
  final String error;
  LoginInvalid(this.error);
}

class LoginNavigating extends LoginState {}
