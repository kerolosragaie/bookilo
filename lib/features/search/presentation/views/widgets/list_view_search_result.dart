import 'package:bookilo/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../home/presentation/views/widgets/item_book.dart';

class SearchResultListView extends StatelessWidget {
  final List<BookModel> booksList;
  const SearchResultListView({super.key, required this.booksList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      itemCount: booksList.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookItem(
            bookModel: booksList[index],
          ),
        );
      },
    );
  }
}
