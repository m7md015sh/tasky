import 'package:dartz/dartz.dart';
import 'package:tasky/core/errors/failures.dart';
import 'package:tasky/features/home/data/model/all_tasks_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, AllTaskModel>> getAllTasks(int pageNumber);
}
