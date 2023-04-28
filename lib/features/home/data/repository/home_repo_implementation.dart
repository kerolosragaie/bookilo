import 'package:bookilo/core/utils/api_service.dart';
import 'package:bookilo/features/home/data/models/book_model/book_model.dart';
import 'package:bookilo/core/errors/failures.dart';
import 'package:bookilo/features/home/data/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImpl extends HomeRepository {
  final ApiService apiService;

  HomeRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?q=subject:Programming&Sorting=newest&Filtering=free-ebooks");
      List<BookModel> bookModelsList = [];
      data["items"].forEach(
          (element) => bookModelsList.add(BookModel.fromJson(element)));
      return Right(
        bookModelsList,
      );
    } catch (e) {
      if (e is DioError) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: "volumes?q=subject:Programming&Filtering=free-ebooks");
      List<BookModel> bookModelsList = [];
      data["items"].forEach(
          (element) => bookModelsList.add(BookModel.fromJson(element)));
      return Right(
        bookModelsList,
      );
    } catch (e) {
      if (e is DioError) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
