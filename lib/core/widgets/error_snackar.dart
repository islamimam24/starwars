import 'package:flutter/material.dart';
import 'package:starwars/core/utils/colors.dart';
import 'package:starwars/core/utils/dimensions.dart';
import 'package:starwars/core/widgets/big_text.dart';
import 'package:starwars/main.dart';

final _scaffoldMessengerState = scaffoldKey.currentState;
void errorSnackBar(String title, String statement, {Duration duration = const Duration(seconds: 2)}) {
  _scaffoldMessengerState?.showSnackBar(SnackBar(
      width: KDimensions.wd390 - KDimensions.wd30,
      backgroundColor: kCardsColor,
      behavior: SnackBarBehavior.floating,
      duration: duration,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(KDimensions.dim10)),
      content: SizedBox(
        width: KDimensions.wd390,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.orange,
            ),
            SizedBox(width: KDimensions.wd10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BigText(
                  title: title,
                  color: Colors.white,
                  fontSize: KDimensions.dim16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: KDimensions.ht5),
                SizedBox(
                  width: KDimensions.wd285,
                  child: BigText(
                    title: statement,
                    color: Colors.white,
                    fontSize: KDimensions.dim14,
                    overFlow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ],
        ),
      )));
}
