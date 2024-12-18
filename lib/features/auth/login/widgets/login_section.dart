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
import 'package:tasky/features/auth/login/login_cubit/login_cubit.dart';
import 'package:tasky/features/auth/signup/signup_screen.dart';
import 'package:tasky/features/home/home_screen.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.w),
      child: Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: AppPadding.p24.h),
              child: Text(
                AppStrings.login,
                style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s24),
              ),
            ),
            CustomTextField(
              hint: AppStrings.phoneExample,
              isPhoneNumber: true,
              onSavedPhone: (value) {
                context.read<LoginCubit>().phoneNumber = value!;
              },
              validator: (v) {
                return v?.isEmpty ?? true ? 'Please enter a valid number' : null;
              },
            ),
            SizedBox(height: AppSize.s8.h),
            CustomTextField(
              hint: AppStrings.password,
              isPassword: true,
              onSaved: (value) {
                context.read<LoginCubit>().password = value ?? '';
              },
              validator: (v) {
                return v?.isEmpty ?? true ? 'Please enter a valid password' : null;
              },
            ),
            SizedBox(height: AppSize.s24.h),
            CustomBtn(
              title: AppStrings.loginBtn,
              onTap: () {
                if (context.read<LoginCubit>().formKey.currentState?.validate() ?? false) {
                  context.read<LoginCubit>().formKey.currentState?.save();
                  context.read<LoginCubit>().validateAndLogin();
                }
              },
            ),
            SizedBox(height: AppSize.s24.h),
            InfoAndTextBtn(
              message: AppStrings.doNotHaveAccount,
              actionText: AppStrings.signupBtn,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                  return const SignupScreen();
                }));
              },
            ),
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                } else if (state is LoginInvalid) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
