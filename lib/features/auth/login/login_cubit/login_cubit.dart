import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/phone_number.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  late PhoneNumber phoneNumber;
  late String password;
  final formKey = GlobalKey<FormState>();

  void validateAndLogin() {
    final validationError = _validateFields(phoneNumber, password);

    if (validationError != null) {
      emit(LoginInvalid(validationError));
      return;
    }

    emit(LoginSuccess());
  }

  String? _validateFields(PhoneNumber phoneNumber, String password) {
    if (phoneNumber.toString().isEmpty) {
      return "Phone number is required";
    }

    if (password.isEmpty) {
      return "Password is required";
    } else if (password.length < 6) {
      return "Password must be at least 6 characters";
    }

    return null;
  }
}
