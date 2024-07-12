import 'package:flutter/material.dart';
import 'package:starwars/core/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final TextOverflow? overFlow;
  final double? height;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextDirection? textDirection;

  const SmallText({
    super.key,
    required this.title,
    this.color,
    this.fontSize,
    this.overFlow,
    this.textAlign,
    this.height,
    this.fontWeight,
    this.maxLines,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaleFactor: 1,
      style: TextStyle(
        height: height ?? 1.53,
        color: color ?? Colors.black87,
        fontSize: fontSize ?? KDimensions.dim12,
        fontWeight: fontWeight,
        // fontFamily: "Inter",
      ),
      overflow: overFlow ?? TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 1,
      textDirection: textDirection,

      // softWrap: true,
    );
  }
}
