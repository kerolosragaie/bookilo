import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import 'item_book.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return LiveSliverList(
      controller: ScrollController(),
      showItemDuration: const Duration(milliseconds: 400),
      itemCount: 10,
      itemBuilder: _buildAnimatedList,
    );
  }

  Widget _buildAnimatedList(
      BuildContext context, int index, Animation<double> animation) {
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
  }
}
/*

SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: BookItem(),
          );
        },
      ),
    );

 */
