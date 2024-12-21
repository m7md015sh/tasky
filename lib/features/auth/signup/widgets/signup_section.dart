import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';
import 'package:tasky/core/shared_widgets/custom_btn.dart';
import 'package:tasky/core/shared_widgets/custom_text_field.dart';
import 'package:tasky/core/shared_widgets/info_and_text_btn.dart';
import 'package:tasky/features/auth/login/login_screen.dart';
import 'package:tasky/features/auth/signup/signup_cubit/signup_cubit.dart';

import '../../../../core/shared_widgets/loading_animation.dart';

class SignupSection extends StatelessWidget {
  const SignupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.of(context).pop();

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        } else if (state is SignupLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: LoadingAnimation()),
          );
        } else if (state is SignupInvalid) {
          Navigator.of(context).pop();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.w),
          child: Form(
            key: context.read<SignupCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: AppPadding.p24.h),
                  child: Text(
                    AppStrings.signup,
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s24),
                  ),
                ),
                CustomTextField(
                  hint: AppStrings.name,
                  onSaved: (value) {
                    context.read<SignupCubit>().name = value ?? '';
                  },
                ),
                SizedBox(height: AppSize.s8.h),
                CustomTextField(
                    onSavedPhone: (value) {
                      final phoneNumber = value?.countryCode ?? '';
                      final number = value?.number ?? '';
                      final fullPhoneNumber = '$phoneNumber$number';

                      context.read<SignupCubit>().phoneNumber = fullPhoneNumber;
                    },
                    hint: AppStrings.phoneExample,
                    isPhoneNumber: true),
                SizedBox(height: AppSize.s8.h),
                CustomTextField(
                  hint: AppStrings.yearsOfExperience,
                  onSaved: (value) {
                    final parsedValue = int.tryParse(value ?? "");
                    if (parsedValue != null) {
                      context.read<SignupCubit>().yearsOfExperience =
                          parsedValue;
                    }
                  },
                ),
                SizedBox(height: AppSize.s8.h),
                CustomTextField(
                  dropdownItems: const [
                    AppStrings.fresh,
                    AppStrings.junior,
                    AppStrings.intermediate,
                    AppStrings.senior
                  ],
                  onDropdownChanged: (value) {
                    if (value != null && value.isNotEmpty) {
                      context.read<SignupCubit>().levelOfExperience = value;
                    }
                  },
                  hint: AppStrings.chooseExperienceLevel,
                  isDropdown: true,
                ),
                SizedBox(height: AppSize.s8.h),
                CustomTextField(
                  hint: AppStrings.address,
                  onSaved: (value) {
                    context.read<SignupCubit>().address = value ?? '';
                  },
                ),
                SizedBox(height: AppSize.s8.h),
                CustomTextField(
                    onSaved: (value) {
                      context.read<SignupCubit>().password = value ?? '';
                    },
                    hint: AppStrings.password,
                    isPassword: true),
                SizedBox(height: AppSize.s8.h),
                CustomBtn(
                    title: AppStrings.signup,
                    onTap: () {
                      final formKey = context.read<SignupCubit>().formKey;
                      if (formKey.currentState?.validate() ?? false) {
                        formKey.currentState?.save();
                        context.read<SignupCubit>().validateAndSignup();
                      }
                    }),
                SizedBox(height: AppSize.s16.h),
                InfoAndTextBtn(
                  message: AppStrings.alreadyHaveAnyAccount,
                  actionText: AppStrings.loginBtn,
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
