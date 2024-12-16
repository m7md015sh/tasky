import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';

class TaskProcessItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const TaskProcessItem({
    super.key,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(

          padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w, vertical: AppPadding.p16.h),
          decoration: BoxDecoration(
            color: isSelected ? ColorManager.primaryColor : ColorManager.taskProcessBackground,
            borderRadius: BorderRadius.circular(AppRadius.r24.r),
            //border: Border.all(color: ColorManager.grey),
          ),
          child: Center(
            child: Text(
              text,
              style: isSelected? getBoldStyle(
                color: isSelected ? ColorManager.white : ColorManager.taskProcessTxt,
                fontSize: FontSize.s16.sp,
              ): getMediumStyle(
                color: isSelected ? ColorManager.white : ColorManager.taskProcessTxt,
                fontSize: FontSize.s16.sp,
              )
            ),
          ),
        ),
      ),
    );
  }
}
