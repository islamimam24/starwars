import 'package:flutter/material.dart';
import 'package:starwars/core/utils/colors.dart';
import 'package:starwars/core/utils/dimensions.dart';
import 'package:starwars/core/widgets/big_text.dart';

class CustomSilverAppBar extends StatefulWidget {
  final String title, image;
  const CustomSilverAppBar({super.key, required this.title, required this.image});

  @override
  State<CustomSilverAppBar> createState() => _CustomSilverAppBarState();
}

class _CustomSilverAppBarState extends State<CustomSilverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: KDimensions.dim70,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black.withOpacity(.5),
            ),
          ),
          GestureDetector(
            onTap: () {
              ///
              ///
              ///
            },
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: kCardsColor,
      pinned: true,
      expandedHeight: KDimensions.ht300,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(widget.image, fit: BoxFit.fill),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(KDimensions.ht20),
        child: Container(
          width: double.maxFinite,
          height: KDimensions.ht40,
          decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(KDimensions.dim10), topRight: Radius.circular(KDimensions.dim10))),
          child: Center(
              child: BigText(
            title: widget.title,
            fontSize: KDimensions.dim18,
          )),
        ),
      ),
    );
  }
}
