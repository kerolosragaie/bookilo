import 'package:bookilo/features/home/data/models/book_model/book_model.dart';
import 'package:bookilo/features/home/data/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final HomeRepository homeRepository;
  FeaturedBooksCubit({required this.homeRepository})
      : super(FeaturedBooksInitial());

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepository.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(errorMessage: failure.errorMessage));
    }, (booksList) {
      emit(FeaturedBooksSuccess(booksList));
    });
  }
}
