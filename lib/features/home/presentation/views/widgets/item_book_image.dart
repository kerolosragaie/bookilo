import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import 'image_custom_book.dart';

class BookImageItem extends StatelessWidget {
  final bool? showButton;
  const BookImageItem({super.key, this.showButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(kBookDetailsView);
      },
      child: CustomBookImage(
        showButton: showButton ?? false,
      ),
    );
  }
}
