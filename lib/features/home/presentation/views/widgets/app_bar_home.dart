import 'package:bookilo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "BOOKILO",
          style: Styles.appLogo,
        ),
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
