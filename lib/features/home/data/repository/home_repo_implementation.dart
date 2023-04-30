import 'package:bookilo/core/utils/api_service.dart';
import 'package:bookilo/core/models/book_model/book_model.dart';
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
              "volumes?Filtering=free-ebooks&q=computer science&Sorting=newest");
      List<BookModel> bookModelsList = [];
      data["items"].forEach(
        (element) => bookModelsList.add(BookModel.fromJson(element)),
      );
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
        (element) => bookModelsList.add(BookModel.fromJson(element)),
      );
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
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?q=$category&Filtering=free-ebooks&Sorting=relevance");
      List<BookModel> bookModelsList = [];
      data["items"].forEach(
        (element) => bookModelsList.add(BookModel.fromJson(element)),
      );
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
  Future<Either<Failure, List<BookModel>>> fetchSearchForBook(
      {required String bookName}) async {
    try {
      var data = await apiService.get(
          endPoint: "volumes?q=subject:Programming&Filtering=free-ebooks");
      List<BookModel> bookModelsList = [];
      data["items"].forEach((element) {
        BookModel book = BookModel.fromJson(element);
        if (book.volumeInfo!.title!
            .toLowerCase()
            .contains(bookName.toLowerCase())) {
          bookModelsList.add(book);
        }
      });
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
