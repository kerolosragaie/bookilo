import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bookilo/features/home/data/models/book_model/book_model.dart';
import 'package:bookilo/features/home/data/repository/home_repository.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final HomeRepository homeRepository;
  NewestBooksCubit({required this.homeRepository})
      : super(NewestBooksInitial());

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepository.fetchNewestBooks();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errorMessage));
    }, (booksList) {
      emit(NewestBooksSuccess(booksList));
    });
  }
}
