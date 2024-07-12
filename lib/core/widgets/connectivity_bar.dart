import 'package:flutter/material.dart';
import 'package:starwars/core/utils/dimensions.dart';

import 'package:starwars/core/widgets/big_text.dart';
import 'package:starwars/main.dart';

final _scaffoldMessengerState = scaffoldKey.currentState;

void connectivitySnackbar({required bool isConnectionON, Duration? duration}) {
  _scaffoldMessengerState?.showSnackBar(SnackBar(
      width: KDimensions.wd305,
      padding: EdgeInsets.all(KDimensions.dim10),
      backgroundColor: Colors.grey.shade900,
      behavior: SnackBarBehavior.floating,
      duration: duration ?? const Duration(seconds: 3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(KDimensions.dim10)),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/wifi.webp",
            color: isConnectionON ? Colors.green : Colors.grey.shade300,
            width: KDimensions.dim20,
            height: KDimensions.dim20,
          ),
          SizedBox(width: KDimensions.wd10),
          BigText(
            title: isConnectionON ? "You're currently offline" : "Your connection was restored",
            color: Colors.white,
            fontSize: KDimensions.dim15,
            maxLines: 2,
            overFlow: TextOverflow.ellipsis,
          ),
        ],
      )));
}
