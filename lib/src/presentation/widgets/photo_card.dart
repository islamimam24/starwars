import 'package:flutter/material.dart';

import 'package:starwars/core/ext/image_ext.dart';
import 'package:starwars/core/utils/dimensions.dart';
import 'package:starwars/core/widgets/big_text.dart';

class PhotoCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const PhotoCard({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: KDimensions.wd180,
      height: KDimensions.ht180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(KDimensions.dim10),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          width: KDimensions.ht150,
          height: KDimensions.ht150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(KDimensions.dim10),
          ),
          child: Image.network(
            imageUrl,
            width: KDimensions.ht150,
            height: KDimensions.ht150,
            cacheHeight: KDimensions.wd170.cacheSize(context),
            cacheWidth: KDimensions.wd170.cacheSize(context),
          ),
        ),
        BigText(title: title)
      ]),
    );
  }
}
