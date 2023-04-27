import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'item_book_image.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: LiveList.options(
        options: const LiveOptions(
          showItemDuration: Duration(milliseconds: 200),
        ),
        itemBuilder: _buildAnimatedList,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
      ),
    );
  }

  Widget _buildAnimatedList(
      BuildContext context, int index, Animation<double> animation) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: BookImageItem(
          showButton: true,
        ),
      ),
    );
  }
}
