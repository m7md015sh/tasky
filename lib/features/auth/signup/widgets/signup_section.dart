import 'package:flutter/material.dart';
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

class SignupSection extends StatelessWidget {
  const SignupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.w),
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
            const CustomTextField(hint: AppStrings.name),
            SizedBox(height: AppSize.s8.h),
            const CustomTextField(
                hint: AppStrings.phoneExample, isPhoneNumber: true),
            SizedBox(height: AppSize.s8.h),
            const CustomTextField(hint: AppStrings.yearsOfExperience),
            SizedBox(height: AppSize.s8.h),
            const CustomTextField(
              hint: AppStrings.chooseExperienceLevel,
              isDropdown: true,
              dropdownItems: [
                AppStrings.fresh,
                AppStrings.junior,
                AppStrings.intermediate,
                AppStrings.senior
              ],
            ),
            SizedBox(height: AppSize.s8.h),
            const CustomTextField(hint: AppStrings.address),
            SizedBox(height: AppSize.s8.h),
            const CustomTextField(
                hint: AppStrings.password, isPassword: true),
            SizedBox(height: AppSize.s8.h),

            const CustomBtn(title: AppStrings.signup),
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
    );
  }
}
