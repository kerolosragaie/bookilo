import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../../core/widgets/button_custom.dart';

class BookActionsWidget extends StatelessWidget {
  const BookActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: "Free",
            oldPrice: Random().nextInt((500 - 100)),
            textColor: Colors.green,
            onPressed: () {},
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            text: "Free preview",
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            onPressed: () {},
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
