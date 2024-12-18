import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tasky/core/resources/assets_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(JsonAssets.loading,
    height: AppSize.s190.h,
    width: AppSize.s190.w,
    );
  }
}
