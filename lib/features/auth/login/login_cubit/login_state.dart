part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;

  LoginSuccess(this.loginModel);
}

class LoginInvalid extends LoginState {
  final String error;

  LoginInvalid(this.error);
}
