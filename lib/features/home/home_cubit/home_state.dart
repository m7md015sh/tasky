import 'package:tasky/features/home/data/model/all_tasks_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMessage;
  HomeErrorState(this.errorMessage);
}

class HomeSuccessState extends HomeState {
  final AllTaskModel allTaskModel;
  HomeSuccessState(this.allTaskModel);
}
