import 'package:flutter/material.dart';
import 'package:tasky/features/home/add_new_task/widgets/add_image_section.dart';
import 'package:tasky/features/home/add_new_task/widgets/add_new_task_appbar.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AddNewTaskAppbar(),
            AddImageSection(),
          ],
        ),
      ),
    );
  }
}
