import 'package:bookilo/features/home/presentation/views/widgets/app_bar_book_details.dart';
import 'package:bookilo/features/home/presentation/views/widgets/widget_book_details_info.dart';
import 'package:bookilo/features/home/presentation/views/widgets/widget_show_more_books.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: BookDetailsAppBar(),
                ),
                BookDetailsInfoWidget(),
                Expanded(
                  child: SizedBox(
                    height: 16,
                  ),
                ),
                ShowMoreBooksWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
