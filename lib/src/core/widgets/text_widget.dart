import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String txt;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextStyle? style;

  const TextWidget(
      {Key? key,
      required this.txt,
      this.color,
      this.fontWeight,
      this.fontSize,
      this.textAlign,
      this.overflow,
      this.style,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: style?? TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
