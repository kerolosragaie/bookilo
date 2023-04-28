import 'package:bookilo/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'item_book_image.dart';

class BookDetailsListView extends StatelessWidget {
  const BookDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: BookImageItem(
              bookModel: BookModel(),
            ),
          );
        },
      ),
    );
  }
}
