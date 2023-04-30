import 'package:bookilo/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import 'list_view_similar_books.dart';

class ShowSimilarBooksWidget extends StatefulWidget {
  final String category;
  const ShowSimilarBooksWidget({super.key, required this.category});

  @override
  State<ShowSimilarBooksWidget> createState() => _ShowSimilarBooksWidgetState();
}

class _ShowSimilarBooksWidgetState extends State<ShowSimilarBooksWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You may also like",
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
