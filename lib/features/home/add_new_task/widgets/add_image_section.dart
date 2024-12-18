import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/assets_manager.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';
import 'package:tasky/features/home/add_new_task/widgets/icon_and_text.dart';

class AddImageSection extends StatelessWidget {
  const AddImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w,vertical: AppPadding.p32),
      child: DottedBorder(
        color: ColorManager.primaryColor, // frame color
        strokeWidth: AppSize.s2.sp, // Thickness frame
        borderType: BorderType.RRect, // Frame shape (rounded corners)
        dashPattern:  [AppSize.s2.sp, AppSize.s1_5.sp], // condition style [condition width, gap]
        radius:   Radius.circular(AppRadius.r12.r), // Radius for corners
        child: Container(
          width: double.infinity,
          height: AppSize.s56.h,
          alignment: Alignment.center,
          child: const IconAndText(title: AppStrings.addImg, assets: IconAssets.uploadImgIcon,),
        ),
      ),
    );
  }
}
