import 'package:bookilo/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/widget_custom_error.dart';
import '../../../../../core/widgets/widget_loading_indicator.dart';
import 'item_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SimilarBooksLoading) {
            return const LoadingIndicatorWidget();
          } else if (state is SimilarBooksFailure) {
            return CustomErrorWidget(
              errorMessage: state.errorMessage,
            );
          } else if (state is SimilarBooksSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.booksList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: BookImageItem(
                    bookModel: state.booksList[index],
                  ),
                );
              },
            );
          }
          return const LoadingIndicatorWidget();
        },
      ),
    );
  }
}
