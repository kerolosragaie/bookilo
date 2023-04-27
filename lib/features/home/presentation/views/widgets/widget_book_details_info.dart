import 'package:bookilo/features/home/presentation/views/widgets/widget_book_details_actions.dart';
import 'package:bookilo/features/home/presentation/views/widgets/widget_book_rating.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'image_custom_book.dart';

class BookDetailsInfoWidget extends StatelessWidget {
  const BookDetailsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.22),
          child: const CustomBookImage(),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "The Batman Book",
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          "Comic Book",
          style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              color: const Color(0xff707070)),
        ),
        const SizedBox(
          height: 18,
        ),
        const BookRatingWidget(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: BookActionsWidget(),
        ),
      ],
    );
  }
}
