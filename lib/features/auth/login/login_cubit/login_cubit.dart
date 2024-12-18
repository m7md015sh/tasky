import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/errors/failures.dart';
import 'package:tasky/features/auth/data/repos/auth_repo.dart';
import 'package:tasky/features/auth/data/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo; // تمرير الـ Repository

  String phoneNumber = ''; // إزالة PhoneNumber object لتبسيط العمل
  String password = '';
  final formKey = GlobalKey<FormState>();

  LoginCubit(this.authRepo) : super(LoginInitial());

  /// التحقق من صحة المدخلات وإجراء عملية تسجيل الدخول
  Future<void> validateAndLogin() async {
    final validationError = _validateFields(phoneNumber, password);

    if (validationError != null) {
      emit(LoginInvalid(validationError));
      return;
    }

    emit(LoginLoading());

   // final phoneString = phoneNumber.toString(); // تحويل كائن PhoneNumber إلى نص
    final result = await authRepo.login(phoneNumber, password);

    result.fold(
          (failure) {
        emit(LoginInvalid(_mapFailureToMessage(failure)));
      },
          (loginModel) {
        emit(LoginSuccess(loginModel));
        print(phoneNumber);
      },
    );
  }


  /// التحقق من صحة الحقول
  String? _validateFields(String phoneNumber, String password) {
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

  /// تحويل الأخطاء إلى رسائل مخصصة
  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.error ;
    }
    return 'error';
  }
}
