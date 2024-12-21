
part of 'signup_cubit.dart';



abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final RegisterModel loginModel;

  SignupSuccess(this.loginModel);
}

class SignupInvalid extends SignupState {
  final String error;

  SignupInvalid(this.error);
}
