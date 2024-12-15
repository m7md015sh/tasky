import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/assets_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p24.h),
      child: Image.asset(
        ImageAssets.onBoardingImg,
        width: double.infinity,
        height: 400.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
