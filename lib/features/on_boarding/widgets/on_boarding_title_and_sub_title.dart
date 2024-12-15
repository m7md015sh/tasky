import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';

class OnBoardingTitleAndSubTitleSection extends StatelessWidget {
  const OnBoardingTitleAndSubTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p65.w),
          child: Text(
            AppStrings.onBoardingTitle,
            textAlign: TextAlign.center,
            style: getBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s24.sp),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: AppPadding.p16.h,
              left: AppPadding.p60.w,
              right: AppPadding.p60.w),
          child: Text(
            AppStrings.onBoardingSubTitle,
            textAlign: TextAlign.center,
            style: getRegularStyle(
                color: ColorManager.grey, fontSize: FontSize.s14.sp),
          ),
        ),
      ],
    );
  }
}
