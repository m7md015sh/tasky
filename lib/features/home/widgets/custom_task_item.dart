import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/assets_manager.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';
import 'package:tasky/features/home/data/model/all_tasks_model.dart';
import 'package:tasky/features/home/widgets/icon_and_process_type.dart';
import 'package:tasky/features/home/widgets/process_container.dart';

class CustomTaskItem extends StatelessWidget {
  const CustomTaskItem({super.key,  this.taskModel});
   final TaskModel? taskModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p24.w, vertical: AppPadding.p16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة العنصر
          Flexible(
            flex: 1,
            child: SizedBox(
              width: 64.w,
              height: 64.h,
              child: Image.asset(
                ImageAssets.exampleItem,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: AppPadding.p16.w),

          // التفاصيل
          Flexible(
            flex: 6,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex:6,
                      child: Text(
                        taskModel?.title?? 'Grocery Shopping...',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s16.sp),
                        maxLines: 1,
                        //overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const Spacer(flex: 1,),

                    // حالة العملية
                    const Flexible(
                      flex: 2,
                      child: ProcessContainer(processId: 1),
                    ),
                  ],
                ),
                SizedBox(height: AppSize.s8.h),

                // وصف العملية
                Text(
                  taskModel?.desc?? 'This application is designed for s...',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: getRegularStyle(
                    color: ColorManager.taskSubTitleTxt,
                    fontSize: FontSize.s14.sp,
                  ),
                ),
                SizedBox(height: AppSize.s8.h),

                Row(
                  children: [
                     Flexible(
                      flex: 3,
                      child: IconAndProcessType(priority: taskModel?.priority??''),
                    ),

                    const Spacer(),

                    Flexible(
                      flex: 3,
                      child: FittedBox(
                        child: Text(
                       '${taskModel?.createdAt}',
                          style: getRegularStyle(
                              color: ColorManager.grey,
                              fontSize: FontSize.s12.sp),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          Flexible(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }
}
