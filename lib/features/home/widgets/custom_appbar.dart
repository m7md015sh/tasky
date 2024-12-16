import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/resources/assets_manager.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: AppPadding.p8.h,horizontal: AppPadding.p24.w),
      child: Row(
        children: [
          Text(AppStrings.logoTxt,
            style:  getBoldStyle(color: ColorManager.black,fontSize: FontSize.s24.sp),
          ),
          const Spacer(),
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: AppPadding.p8.w,right: AppPadding.p16.w),
                child: SvgPicture.asset(IconAssets.personIcon,height: AppSize.s24.h,width: AppSize.s24.w),
              ),
              Padding(
                padding:  EdgeInsets.only(left: AppPadding.p8.w,right: AppPadding.p16.w),
                child: SvgPicture.asset(IconAssets.logoutIcon,height: AppSize.s24.h,width: AppSize.s24.w),
              ),

            ],
          )
        ],

      ),
    );
  }
}
