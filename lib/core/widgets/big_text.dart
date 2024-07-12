import 'package:flutter/material.dart';
import 'package:starwars/core/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final TextOverflow? overFlow;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? height;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool? isLineThrough;
  final TextDirection? textDirection;

  const BigText({
    super.key,
    required this.title,
    this.color,
    this.fontSize,
    this.overFlow,
    this.fontWeight,
    this.height,
    this.maxLines,
    this.fontFamily,
    this.textAlign,
    this.isLineThrough = false,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 1,
      textScaleFactor: 1,
      textDirection: textDirection,
      style: TextStyle(
        decorationThickness: 1.5,
        overflow: overFlow ?? TextOverflow.ellipsis,
        color: color ?? Colors.grey.shade100,
        fontSize: fontSize ?? KDimensions.dim16,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: fontFamily ?? "Inter",
        height: height ?? 1,
      ),
    );
  }
}
