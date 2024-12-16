import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';

import 'task_process_item.dart';
class TaskProcessSection extends StatelessWidget {
  const TaskProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.w,
      child:  Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TaskProcessItem(
              text: AppStrings.all,
              isSelected: true,
            ),

            TaskProcessItem(
              text: AppStrings.inProgress,
            ),

            TaskProcessItem(
              text: AppStrings.waiting,
            ),

            TaskProcessItem(
              text: AppStrings.finished,
            ),
          ],
        ),
      ),
    );
  }
}
