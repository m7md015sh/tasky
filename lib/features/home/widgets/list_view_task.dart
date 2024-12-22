import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/shared_widgets/loading_animation.dart';
import 'package:tasky/features/home/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/home_cubit/home_state.dart';
import 'package:tasky/features/home/widgets/custom_task_item.dart';

class ListViewTask extends StatelessWidget {
  const ListViewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(child: LoadingAnimation());
        } else if (state is HomeErrorState) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        } else if (state is HomeSuccessState) {
          return ListView.builder(
            itemCount: state.allTaskModel.tasks.length,
            itemBuilder: (context, index) {
             // final task = state.allTasksModel[index];
              return CustomTaskItem(taskModel: state.allTaskModel.tasks[index]);
            },
          );
        }
        return const Center(child: Text('No tasks available'));
      },
    );
  }
}
