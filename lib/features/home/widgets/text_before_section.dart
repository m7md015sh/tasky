import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';


class TextBeforeSection extends StatelessWidget {
  const TextBeforeSection({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding:  EdgeInsets.symmetric(
        vertical: AppPadding.p12.h,
          horizontal: AppPadding.p24.w
      ),
      child: Text(text,style: getBoldStyle(color: ColorManager.grey,fontSize: FontSize.s16.sp),

      ),
    );
  }
}