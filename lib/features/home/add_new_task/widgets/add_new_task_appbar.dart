import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/resources/assets_manager.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';

class AddNewTaskAppbar extends StatelessWidget {
  const AddNewTaskAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding:   EdgeInsets.symmetric(horizontal: AppPadding.p16.w,vertical:AppPadding.p16.h ),
            child: SvgPicture.asset(IconAssets.arrowLeftIcon,color: ColorManager.black,),
          ),
        ),

        Text(AppStrings.addNewTask,
          style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
        )

      ],
    );
  }
}
