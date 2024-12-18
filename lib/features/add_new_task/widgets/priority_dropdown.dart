import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/resources/assets_manager.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';

class PriorityDropdown extends StatefulWidget {
  final ValueChanged<String>? onPriorityChanged;
  const PriorityDropdown({
    super.key,
    this.onPriorityChanged,
  });

  @override
  State<PriorityDropdown> createState() => _PriorityDropdownState();
}

class _PriorityDropdownState extends State<PriorityDropdown> {
  final List<String> priorityList = [
    "Low Priority",
    "Medium Priority",
    "High Priority"
  ];
  String selectedPriority = "Medium Priority";

  final backgroundColor = ColorManager.taskItemInProcessBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      constraints: BoxConstraints(minHeight: 50.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            IconAssets.flagIcon,
            height: AppSize.s24.h,
            width: AppSize.s24.w,
          ),
          SizedBox(width: AppSize.s16.w),

          const Spacer(),

          // Dropdown button
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedPriority,
              icon: Flexible(
                  child: SvgPicture.asset(
                IconAssets.arrowDownIcon,
                width: AppSize.s24.w,
                height: AppSize.s24.h,
              )),
              items: priorityList
                  .map((priority) => DropdownMenuItem(
                        value: priority,
                        child: Padding(
                          padding: EdgeInsets.only(right: AppPadding.p140.w),
                          child: Text(priority,
                              style: TextStyle(
                                color: ColorManager.primaryColor,
                                fontSize: 16.sp,
                              )),
                        ),
                      ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedPriority = newValue!;
                });
                if (widget.onPriorityChanged != null) {
                  widget.onPriorityChanged!(selectedPriority);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
