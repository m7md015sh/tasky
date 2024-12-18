import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';
import 'package:tasky/core/shared_widgets/custom_text_field.dart';

class TitleAndForm extends StatelessWidget {
  const TitleAndForm(
      {super.key,
      required this.title,
      required this.hint,
      required this.maxLines});
  final String title;
  final String hint;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getRegularStyle(
                color: ColorManager.grey, fontSize: FontSize.s12.sp),
          ),
          SizedBox(
            height: AppSize.s4.h,
          ),
          CustomTextField(
            hint: hint,
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}
