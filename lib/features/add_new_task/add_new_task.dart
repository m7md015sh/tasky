import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';
import 'package:tasky/core/shared_widgets/custom_btn.dart';


import 'widgets/add_image_section.dart';
import 'widgets/add_new_task_appbar.dart';
import 'widgets/date_picker_field.dart';
import 'widgets/priority_dropdown.dart';
import 'widgets/title_and_form.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AddNewTaskAppbar(),
              const AddImageSection(),
              const TitleAndForm(
                title: AppStrings.taskTitle,
                hint: AppStrings.taskHint,
                maxLines: 1,
              ),
              SizedBox(
                height: AppSize.s24.h,
              ),
              const TitleAndForm(
                title: AppStrings.taskDescription,
                hint: AppStrings.enterDescriptionHere,
                maxLines: 6,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p16.w, vertical: AppPadding.p8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.priority,
                      style: getRegularStyle(
                          color: ColorManager.grey, fontSize: FontSize.s12.sp),
                    ),
                    SizedBox(
                      height: AppSize.s4.h,
                    ),
                    PriorityDropdown(
                      onPriorityChanged: (selected) {
                        debugPrint("Selected Priority: $selected");
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p16.w, vertical: AppPadding.p8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.dueDate,
                      style: getRegularStyle(
                          color: ColorManager.grey, fontSize: FontSize.s12.sp),
                    ),
                    SizedBox(
                      height: AppSize.s4.h,
                    ),
                    const DatePickerField(),
                  ],
                ),
              ),
              SizedBox(
                height: AppSize.s16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p16.w, vertical: AppPadding.p8.h),
                child: const CustomBtn(title: AppStrings.addTask),
              )
            ],
          ),
        ),
      ),
    );
  }
}
