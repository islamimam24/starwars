import 'package:flutter/material.dart';
import 'package:starwars/core/utils/colors.dart';
import 'package:starwars/core/utils/dimensions.dart';

class AppBarIcon extends StatelessWidget {
  final IconData iconShape;
  final double? iconSize;
  final Color? iconColor;
  const AppBarIcon({
    super.key,
    required this.iconShape,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KDimensions.dim36,
      width: KDimensions.dim36,
      decoration: BoxDecoration(color: kCardsColor, borderRadius: BorderRadius.circular(KDimensions.dim18)),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: KDimensions.wd6),
        child: Icon(
          iconShape,
          color: Colors.white,
          size: KDimensions.wd15,
        ),
      ),
    );
  }
}
