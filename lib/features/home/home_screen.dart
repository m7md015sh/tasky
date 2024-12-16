import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';
import 'package:tasky/features/home/widgets/task_process_list_view.dart';
import 'package:tasky/features/home/widgets/text_before_section.dart';

import 'widgets/custom_appbar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
         ],
        ),
      ),
    );
  }
}
