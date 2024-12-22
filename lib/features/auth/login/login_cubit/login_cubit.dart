import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/errors/failures.dart';
import 'package:tasky/core/services/token_storage_service.dart';
import 'package:tasky/features/auth/data/repos/auth_repo.dart';
import 'package:tasky/features/auth/data/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  String phoneNumber = '';
  String password = '';
  final formKey = GlobalKey<FormState>();

  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> validateAndLogin() async {
    final validationError = _validateFields(phoneNumber, password);

    if (validationError != null) {
      emit(LoginInvalid(validationError));
      return;
    }

    emit(LoginLoading());

    final result = await authRepo.login(phoneNumber, password);

    result.fold(
          (failure) {
        emit(LoginInvalid(_mapFailureToMessage(failure)));
      },
          (loginModel)async {

            print('=========================');
            print(loginModel.accessToken);
            await TokenStorage.saveTokens(
              accessToken: loginModel.accessToken,
              refreshToken: loginModel.refreshToken,
            );
        emit(LoginSuccess(loginModel));

      },
    );
  }


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

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.error ;
    }
    return 'error';
  }
}
