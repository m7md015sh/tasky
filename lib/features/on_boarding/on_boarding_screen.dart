import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';
import 'package:tasky/core/shared_widgets/custom_btn.dart';
import 'package:tasky/features/on_boarding/widgets/on_boarding_title_and_sub_title.dart';

import 'widgets/on_boarding_image_section.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const OnBoardingImageSection(),
            const OnBoardingTitleAndSubTitleSection(),
            Padding(
              padding: EdgeInsets.only(top: AppPadding.p32.h),
              child: CustomBtn(title: AppStrings.onBoardingBtnText,haveIcon: true,onTap: (){

              },),
            )

          ],
        ),
      ),
    );
  }
}
