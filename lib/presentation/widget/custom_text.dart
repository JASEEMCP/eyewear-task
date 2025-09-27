import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.txt,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.textAlign,
    this.maxLines,
  });

  final String txt;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      maxLines: maxLines,
      textAlign: textAlign,
      textScaler: TextScaler.linear(1),
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize ?? 16,
        color: color,
      ),
    );
  }
}
