import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/widget_loading_indicator.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import 'item_book.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksLoading) {
          return const SliverToBoxAdapter(
            child: LoadingIndicatorWidget(),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: ErrorWidget(state.errorMessage),
          );
        } else if (state is NewestBooksSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            sliver: LiveSliverList(
              controller: ScrollController(),
              showItemDuration: const Duration(milliseconds: 400),
              itemCount: state.booksList.length,
              itemBuilder: (context, index, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -0.1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(animation),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: BookItem(),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const SliverToBoxAdapter(
          child: LoadingIndicatorWidget(),
        );
      },
    );
  }
}


/*
return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksLoading) {
          return const LoadingIndicatorWidget();
        } else if (state is NewestBooksFailure) {
          return ErrorWidget(state.errorMessage);
        } else if (state is NewestBooksSuccess) {
          return LiveSliverList(
            controller: ScrollController(),
            showItemDuration: const Duration(milliseconds: 400),
            itemCount: state.booksList.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(
                  opacity: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(animation),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: BookItem(),
                  ),
                ),
              );
            },
          );
        }
        return const LoadingIndicatorWidget();
      },
    );

 */