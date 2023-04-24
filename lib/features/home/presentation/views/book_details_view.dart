import 'package:bookilo/features/home/presentation/views/widgets/body_book_details.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BookDetailsBody()),
    );
  }
}
