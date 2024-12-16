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
      child:  Row(

        children: [
            const TaskProcessItem(
            text: AppStrings.all,
            isSelected: true,
          ),
           const TaskProcessItem(
            text: AppStrings.inProgress,
          ),
            const TaskProcessItem(
            text: AppStrings.waiting,
          ),
          Padding(
            padding: EdgeInsets.only(right: AppPadding.p24.w),
            child: const TaskProcessItem(
              text:AppStrings.finished,
            ),
          ),
        ],
      ),
    );
  }
}
