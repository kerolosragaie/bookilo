import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'text_field_search.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextField(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Text(
                "Search Result",
                style: Styles.textStyle18,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        //TODO uncomment when implment search view
        // const Expanded(
        //   child: SearchResultListView(),
        // ),
      ],
    );
  }
}
