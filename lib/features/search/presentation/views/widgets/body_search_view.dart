import 'package:bookilo/core/constants/assets_data.dart';
import 'package:bookilo/core/widgets/widget_custom_error.dart';
import 'package:bookilo/core/widgets/widget_loading_indicator.dart';
import 'package:bookilo/features/search/presentation/manager/search_for_book_cubit/search_for_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import 'list_view_search_result.dart';
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
        Expanded(
          child: BlocBuilder<SearchForBookCubit, SearchForBookState>(
            builder: (context, state) {
              if (state is SearchForBookLoading) {
                return const LoadingIndicatorWidget();
              } else if (state is SearchForBookFailure) {
                return CustomErrorWidget(errorMessage: state.errorMessage);
              } else if (state is SearchForBookSuccess) {
                return SearchResultListView(
                  booksList: state.booksList,
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsData.kTalkingBook,
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Let's search",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
