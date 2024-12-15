import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/core/resources/assets_manager.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.title, this.haveIcon=false, this.onTap});
  final String title;
  final bool haveIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p22.w),
        child: Container(
          height: 49.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.r12.r))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal:AppPadding.p8.w),
                child: Center(child: Text(title,textAlign: TextAlign.center,style: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s19.sp),)),
              ),
              haveIcon ?  SvgPicture.asset(IconAssets.arrowLeftIcon,color: ColorManager.white,) :const SizedBox()

            ],
          ),
        ),
      ),
    );
  }
}
 