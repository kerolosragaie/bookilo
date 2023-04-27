import 'package:flutter/material.dart';
import 'text_field_search.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SearchTextField(),
      ],
    );
  }
}
