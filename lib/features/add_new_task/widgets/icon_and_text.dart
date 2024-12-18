import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';

class IconAndText extends StatelessWidget {
  const IconAndText({super.key, required this.assets, required this.title});
  final String title;
  final String assets;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p4.w),
          child: SvgPicture.asset(
            assets,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p4.w),
          child: Text(
            title,
            style: getMediumStyle(
                color: ColorManager.primaryColor, fontSize: FontSize.s19.sp),
          ),
        )
      ],
    );
  }
}
