import 'package:bookilo/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../home/presentation/views/widgets/item_book.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookItem(
            bookModel: BookModel(),
          ),
        );
      },
    );
  }
}
