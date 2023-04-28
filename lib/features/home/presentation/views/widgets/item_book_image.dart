import 'package:bookilo/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import 'image_custom_book.dart';

class BookImageItem extends StatelessWidget {
  final bool? showButton;
  final BookModel bookModel;
  const BookImageItem({super.key, this.showButton, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(kBookDetailsView);
      },
      child: CustomBookImage(
        imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail,
        showButton: showButton ?? false,
      ),
    );
  }
}
