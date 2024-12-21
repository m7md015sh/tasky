import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/errors/failures.dart';
import 'package:tasky/features/auth/data/repos/auth_repo.dart';

import '../../data/models/register_model.dart';
part  'signup_state.dart';


class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;

  String name = '';
  String phoneNumber = '';
  int yearsOfExperience =0;
  String levelOfExperience = '';
  String address = '';
  String password = '';
  final formKey = GlobalKey<FormState>();

  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> validateAndSignup() async {
    final validationError = _validateFields(name,phoneNumber,yearsOfExperience.toString(), levelOfExperience,address,password);
    emit(SignupLoading());

    if (validationError != null) {
      emit(SignupInvalid(validationError));
      return;
    }


    final result = await authRepo.register(phoneNumber,password,name,yearsOfExperience,address,levelOfExperience);

    result.fold(
          (failure) {
        emit(SignupInvalid(_mapFailureToMessage(failure)));
      },
          (signupModel) {
        emit(SignupSuccess(signupModel));
      },
    );
  }


  String? _validateFields(String name, String phoneNumber, String yearsOfExperience, String levelOfExperience, String address, String password) {
    debugPrint('Level of Experience: $levelOfExperience'); // تحقق من القيمة هنا

    if (name.isEmpty) {
      return AppStrings.nameIsRequired;
    }

    if (phoneNumber.isEmpty) {
      return AppStrings.phoneIsRequired;
    }

    final parsedExperience = int.tryParse(yearsOfExperience);
    if (parsedExperience == null || parsedExperience < 0) {
      return AppStrings.invalidYearsOfExperience;
    }

    if (levelOfExperience.isEmpty) {
      return AppStrings.levelOfExperienceRequired;
    }

    if (address.isEmpty) {
      return AppStrings.addressIsRequired;
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
