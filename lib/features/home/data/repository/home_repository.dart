import '../../../../core/errors/failures.dart';
import '../models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, BookModel>> fetchFeatureBooks();
  Future<Either<Failure, BookModel>> fetchBestSellerBooks();
}