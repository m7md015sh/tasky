import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';

class ProcessContainer extends StatelessWidget {
  const ProcessContainer({super.key, required this.processId});
  final int processId;

  @override
  Widget build(BuildContext context) {
    return processId==0? Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p4.w,vertical:AppPadding.p4.h ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.r5.r)),
          color:ColorManager.taskItemWaitingBackground
      ),
      child: Text(AppStrings.waiting,style: getRegularStyle(color: ColorManager.taskItemWaitingText),),
    ): processId==1? Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p4.w,vertical:AppPadding.p4.h ),

      decoration: BoxDecoration(

          borderRadius: BorderRadius.all(Radius.circular(AppRadius.r5.r)),
          color:ColorManager.taskItemInProcessBackground
      ),
      child: Text(AppStrings.inProgress,style: getRegularStyle(color: ColorManager.primaryColor),),

    ): Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p4.w,vertical:AppPadding.p4.h ),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.r5.r)),
          color:ColorManager.taskItemFinishedBackground
      ),
      child: Text(AppStrings.finished,style: getRegularStyle(color: ColorManager.taskItemFinishedText),),

    );
  }
}
