import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/styles.dart';

class BookRatingWidget extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  const BookRatingWidget(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 16,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          "4.8",
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            "(245)",
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
