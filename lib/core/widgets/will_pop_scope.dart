import 'dart:io';
import 'package:flutter/material.dart';

class CustomWillPopScope extends StatelessWidget {
  const CustomWillPopScope({
    required this.child,
    this.onWillPop,
    super.key,
  });

  final Widget child;
  final WillPopCallback? onWillPop;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox.expand(
            child: GestureDetector(
              onHorizontalDragUpdate: (details) async {
                if (details.delta.dx > 0 && onWillPop != null) {
                  await onWillPop!.call().then((value) => Navigator.pop(context));
                }
              },
              child: WillPopScope(
                onWillPop: onWillPop,
                child: child,
              ),
            ),
          )
        : WillPopScope(
            onWillPop: onWillPop,
            child: child,
          );
  }
}
