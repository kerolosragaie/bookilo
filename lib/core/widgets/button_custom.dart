import 'package:bookilo/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final num? oldPrice;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final Function onPressed;
  final double? fontSize;
  const CustomButton(
      {super.key,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      this.borderRadius,
      required this.onPressed,
      required this.text,
      this.fontSize,
      this.oldPrice});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        child: oldPrice == null
            ? Text(
                text,
                style: Styles.textStyle16.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w900,
                  fontSize: fontSize,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${oldPrice!} \$",
                    style: Styles.textStyle14.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: fontSize,
                        decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    text,
                    style: Styles.textStyle18.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w900,
                      fontSize: fontSize,
                    ),
                  )
                ],
              ),
        onPressed: () => onPressed(),
      ),
    );
  }
}
