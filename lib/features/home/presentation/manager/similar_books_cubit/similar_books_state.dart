part of 'similar_books_cubit.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksFailure extends SimilarBooksState {
  final String errorMessage;

  const SimilarBooksFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> booksList;

  const SimilarBooksSuccess({required this.booksList});
  @override
  List<Object> get props => [booksList];
}

class SimilarBooksLoading extends SimilarBooksState {}
