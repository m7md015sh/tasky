import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/assets_manager.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';
import 'package:tasky/features/home/widgets/icon_and_process_type.dart';
import 'package:tasky/features/home/widgets/process_container.dart';

class CustomTaskItem extends StatelessWidget {
  const CustomTaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppPadding.p24.w,vertical: AppPadding.p24.h ),
      child: Row(

        children: [
          SizedBox(
              width: 64.w,
              height: 64.h,
              child: Image.asset(ImageAssets.exampleItem)),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
            child: SizedBox(
              width: 219.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                   children: [
                     Text('Grocery Shopping...',
                         style:getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp)
                     ),
                    const Spacer(),

                     const ProcessContainer(processId: 2),
                   ],
                  ),
                  SizedBox(
                    height: AppSize.s8.h,
                  ),
                  Text('This application is designed for s...',overflow: TextOverflow.ellipsis,maxLines: 1,style: getRegularStyle(color: ColorManager.taskSubTitleTxt,fontSize: FontSize.s14.sp),),
                  SizedBox(
                    height: AppSize.s8.h,
                  ),
                  Row(
                    children: [
                      const IconAndProcessType(processId:2,),
                      const Spacer(),
                      Text(AppStrings.dateExample,style: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s12.sp),)
                    ],
                  )

                ],
              ),
            ),
          ),
          Expanded(child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)))
        ],
      ),
    );
  }
}
