import 'package:flutter/material.dart';
import 'package:tasky/features/home/widgets/custom_task_item.dart';

class ListViewTask extends StatelessWidget {
   ListViewTask({super.key, required this.processId});
  final int processId;
  final tasks = List.generate(
    10,
        (index) => {'id': index, 'processId': index % 3},
  );
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 10,itemBuilder: (context,index){
      return CustomTaskItem(processId: tasks[index]['processId'] as int);
    });



  }
}
