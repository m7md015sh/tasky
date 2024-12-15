import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/shared_widgets/custom_btn.dart';

class InfoAndTextBtn extends StatelessWidget {
  const InfoAndTextBtn({super.key, required this.message, required this.actionText, required this.onTap});
  final String message;
  final String actionText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s14.sp),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: getBoldStyle(color: ColorManager.blue,fontSize: FontSize.s14.sp).copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
