import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/assets_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';
import 'package:tasky/features/auth/signup/widgets/signup_section.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [

              Positioned(
                top: AppSize.ns90.h,
                right: AppSize.s0.w,
                left: AppSize.s0.w,
                child: Container(
                  height: AppSize.s482.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.onBoardingImg),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: AppSize.s232.h),
                child: const SignupSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
