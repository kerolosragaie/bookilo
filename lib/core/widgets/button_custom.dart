import 'package:bookilo/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
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
      this.fontSize});

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
        child: Text(
          text,
          style: Styles.textStyle16.copyWith(
            color: textColor,
            fontWeight: FontWeight.w900,
            fontSize: fontSize,
          ),
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}
