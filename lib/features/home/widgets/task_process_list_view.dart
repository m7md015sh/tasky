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
      child: Padding(
        padding:  EdgeInsets.only(right: AppPadding.p16.h),
        child: const Row(
          children: [
            Expanded(
              child: TaskProcessItem(
                text: AppStrings.all,
                isSelected: true,
              ),
            ),

            Expanded(
              child: TaskProcessItem(
                text: AppStrings.inProgress,
              ),
            ),

            Expanded(
              child: TaskProcessItem(
                text: AppStrings.waiting,
              ),
            ),

            Expanded(
              child: TaskProcessItem(
                text: AppStrings.finished,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
