import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:tasky/core/resources/strings_manager.dart';
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
      return AppStrings.phoneIsRequired;
    }

    if (password.isEmpty) {
      return AppStrings.passwordIsRequired;
    } else if (password.length < 6) {
      return AppStrings.passwordRequiredLength;
    }

    return null;
  }
}
