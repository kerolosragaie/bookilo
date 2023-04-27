import '../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../models/book_model/item.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Item>>> fetchNewestBooks();
  Future<Either<Failure, List<Item>>> fetchBestSellerBooks();
}
