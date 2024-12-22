import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky/core/errors/failures.dart';
import 'package:tasky/core/services/api_services.dart';
import 'package:tasky/core/services/token_storage_service.dart';
import 'package:tasky/features/home/data/model/all_tasks_model.dart';
import 'package:tasky/features/home/data/repo/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  final ApiService apiService;
  HomeRepoImp(this.apiService);
  @override
  Future<Either<Failure, AllTaskModel>> getAllTasks(int pageNumber) async {
    try {
      final accessToken = await TokenStorage.getAccessToken();
      if (accessToken == null) {
        return Left(ServerFailure('Access token is missing.'));
      }
      var data = await apiService.get(
        endPoint: 'todos?page=$pageNumber',
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (data is List<dynamic>) {
        final allTasks = AllTaskModel.fromJson(data);
        return Right(allTasks);
      } else {
        return Left(ServerFailure('Unexpected data format received'));
      }


    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
