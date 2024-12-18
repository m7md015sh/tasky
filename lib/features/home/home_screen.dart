import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/resources/assets_manager.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';
import 'package:tasky/features/add_new_task/add_new_task.dart';
import 'package:tasky/features/home/widgets/task_process_list_view.dart';
import 'package:tasky/features/home/widgets/text_before_section.dart';

import 'widgets/custom_appbar.dart';
import 'widgets/list_view_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManager.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p8.w, vertical: AppPadding.p8.h),
            child: SizedBox(
                height: AppSize.s50.h,
                width: AppSize.s64.w,
                child: FloatingActionButton(
                  heroTag: 'scanBtn',
                    backgroundColor: ColorManager.scanFloatingBackground,
                    shape: const CircleBorder(),
                    onPressed: () {},
                    child: SvgPicture.asset(IconAssets.scanIcon))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p8.w, vertical: AppPadding.p8.h),
            child: SizedBox(
                height: AppSize.s64.h,
                width: AppSize.s64.w,
                child: FloatingActionButton(
                    heroTag: 'addTaskBtn',

                    backgroundColor: ColorManager.primaryColor,
                    shape: const CircleBorder(),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const AddNewTask();
                      }));
                    },
                    child: Icon(
                      Icons.add,
                      color: ColorManager.white,
                      size: AppSize.s32.sp,
                    ))),
          ),
        ],
      ),
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppbar(),
            SizedBox(
              height: AppSize.s8.h,
            ),
            const TextBeforeSection(text: AppStrings.myTasks),
            const TaskProcessSection(),
            Expanded(child: ListViewTask(processId: 1))
          ],
        ),
      ),
    );
  }
}
