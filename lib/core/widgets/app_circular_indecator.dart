import 'package:flutter/material.dart';
import 'package:starwars/core/utils/dimensions.dart';
import 'package:starwars/core/widgets/small_text.dart';
import 'package:starwars/core/widgets/will_pop_scope.dart';

class AppCircularIndicator extends StatelessWidget {
  final double? strokeWidth;
  const AppCircularIndicator({super.key, this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: KDimensions.dim24,
      width: KDimensions.dim24,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 2,
      ),
    ));
  }
}

showPageLoading(BuildContext context) => showGeneralDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.2),
    pageBuilder: (_, __, ___) {
      return CustomWillPopScope(
        onWillPop: () async => false,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: KDimensions.dim70,
              height: KDimensions.dim70,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(KDimensions.dim8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: KDimensions.dim24,
                    width: KDimensions.dim24,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                  SizedBox(height: KDimensions.ht5),
                  const SmallText(title: "Loading..")
                ],
              ),
            ),
          ),
        ),
      );
    });
