import 'package:bookilo/features/home/data/models/book_model/book_model.dart';
import 'package:bookilo/core/errors/failures.dart';
import 'package:bookilo/features/home/data/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<Either<Failure, BookModel>> fetchBestSellerBooks() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BookModel>> fetchFeatureBooks() {
    throw UnimplementedError();
  }
}
