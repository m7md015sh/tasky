import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/resources/assets_manager.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';

class IconAndProcessType extends StatelessWidget {
  const IconAndProcessType({super.key, required this.processId});
  final int processId;

  @override
  Widget build(BuildContext context) {
    return processId==0? Row(
      children: [
        SvgPicture.asset(
          IconAssets.flagIcon,
          height: AppSize.s16.h,
          width: AppSize.s16.w,
          color:ColorManager.taskItemWaitingText ,
        ),
        SizedBox(
          width: AppSize.s4.w,
        ),

             Text(
                AppStrings.height,
                style: getMediumStyle(color: ColorManager.taskItemWaitingText,fontSize: FontSize.s12.sp),
              )


      ],
    ):processId==1?Row(
      children: [
        SvgPicture.asset(
          IconAssets.flagIcon,
          height: AppSize.s16.h,
          width: AppSize.s16.w,
          color: ColorManager.primaryColor,
        ),
        SizedBox(
          width: AppSize.s4.w,
        ),

        Text(
          AppStrings.medium,
          style: getMediumStyle(color: ColorManager.primaryColor,fontSize: FontSize.s12.sp),
        )


      ],
    ):Row(
      children: [
        SvgPicture.asset(
          IconAssets.flagIcon,
          height: AppSize.s16.h,
          width: AppSize.s16.w,
          color: ColorManager.taskItemFinishedText,
        ),
        SizedBox(
          width: AppSize.s4.w,
        ),

        Text(
          AppStrings.low,
          style: getMediumStyle(color:ColorManager.taskItemFinishedText ,fontSize: FontSize.s12.sp),
        )


      ],
    );
  }
}


/*        processId == 0
            ? Text(
                AppStrings.waiting,
                style: getMediumStyle(color: ColorManager.taskItemWaitingText,fontSize: FontSize.s12.sp),
              )
            : processId == 1
                ? Text(
                    AppStrings.inProgress,
                    style: getMediumStyle(color: ColorManager.primaryColor,fontSize: FontSize.s12.sp),
                  )
                : Text(
                    AppStrings.finished,
                    style: getMediumStyle(
                        color: ColorManager.taskItemFinishedText,fontSize: FontSize.s12.sp),
                  )
                  */