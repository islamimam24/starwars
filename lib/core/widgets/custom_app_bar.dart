import 'package:flutter/material.dart';
import 'package:starwars/core/utils/dimensions.dart';
import 'package:starwars/core/widgets/appbar_icon.dart';
import 'package:starwars/core/widgets/big_text.dart';

PreferredSizeWidget customAppBar({
  required BuildContext context,
  final String? title,
  final FontWeight? fontWeight,
  final bool isBackBtnExist = true,
}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(KDimensions.dim80 + KDimensions.dim18),
      child: Padding(
        padding: EdgeInsets.only(
            top: KDimensions.dim70 - KDimensions.dim10,
            right: KDimensions.wd15,
            left: KDimensions.wd15,
            bottom: KDimensions.dim10 - KDimensions.dim8),
        child: SizedBox(
          height: KDimensions.dim36,
          width: KDimensions.wd390,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isBackBtnExist
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const AppBarIcon(
                        iconShape: Icons.arrow_back_ios,
                      ),
                    )
                  : SizedBox(
                      width: KDimensions.wd36,
                    ),
              title != null
                  ? Center(
                      child: BigText(
                        title: title.toString(),
                        fontSize: KDimensions.dim18,
                        fontWeight: fontWeight ?? FontWeight.w600,
                      ),
                    )
                  : Container(),
              SizedBox(width: KDimensions.wd36),
            ],
          ),
        ),
      ));
}
