import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bookilo/core/models/book_model/book_model.dart';
import 'package:bookilo/features/home/data/repository/home_repository.dart';

part 'search_for_book_state.dart';

class SearchForBookCubit extends Cubit<SearchForBookState> {
  final HomeRepository homeRepository;
  SearchForBookCubit({
    required this.homeRepository,
  }) : super(SearchForBookInitial());

  Future<void> searchForBook({required String bookName}) async {
    emit(SearchForBookLoading());
    var result = await homeRepository.fetchSearchForBook(bookName: bookName);
    result.fold((failure) {
      emit(SearchForBookFailure(failure.errorMessage));
    }, (booksList) {
      emit(SearchForBookSuccess(booksList));
    });
  }
}
