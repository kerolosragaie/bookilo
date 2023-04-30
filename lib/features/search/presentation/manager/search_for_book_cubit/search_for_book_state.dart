part of 'search_for_book_cubit.dart';

abstract class SearchForBookState extends Equatable {
  const SearchForBookState();

  @override
  List<Object> get props => [];
}

class SearchForBookInitial extends SearchForBookState {}

class SearchForBookSuccess extends SearchForBookState {
  final List<BookModel> booksList;

  const SearchForBookSuccess(this.booksList);
  @override
  List<Object> get props => [booksList];
}

class SearchForBookFailure extends SearchForBookState {
  final String errorMessage;

  const SearchForBookFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class SearchForBookLoading extends SearchForBookState {}
