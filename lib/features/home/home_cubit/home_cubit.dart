import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/errors/failures.dart';
import 'package:tasky/features/home/data/repo/home_repo.dart';
import 'package:tasky/features/home/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitialState());
  final HomeRepo homeRepo;

  Future<void> getAllTasks(int pageNumber) async {
    emit(HomeLoadingState());
    final allTasks = await homeRepo.getAllTasks(pageNumber);

    allTasks.fold(
          (failure) {
        emit(HomeErrorState(_mapFailureToMessage(failure)));
      },
          (allTasksModel) {
        emit(HomeSuccessState(allTasksModel));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.error;
    }
    return 'An unknown error occurred';
  }
}
