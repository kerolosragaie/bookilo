import 'package:bookilo/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/home_repository.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final HomeRepository homeRepository;
  SimilarBooksCubit({required this.homeRepository})
      : super(SimilarBooksInitial());

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepository.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksFailure(errorMessage: failure.errorMessage));
    }, (booksList) {
      emit(SimilarBooksSuccess(booksList: booksList));
    });
  }
}
