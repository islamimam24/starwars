import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starwars/core/Routes/routes.dart';
import 'package:starwars/core/utils/dimensions.dart';
import 'package:starwars/core/widgets/big_text.dart';
import 'package:starwars/src/domain/entities/films_entity.dart';
import 'package:starwars/src/domain/entities/starships_entity.dart';
import 'package:starwars/src/presentation/widgets/photo_card.dart';

class StarshipsSlider extends StatefulWidget {
  final List<StarshipEntity> starships;
  const StarshipsSlider({super.key, required this.starships});

  @override
  State<StarshipsSlider> createState() => _StarshipsSliderState();
}

class _StarshipsSliderState extends State<StarshipsSlider> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: KDimensions.ht30),
        BigText(
          title: "Starships",
          fontSize: KDimensions.dim16,
        ),
        SizedBox(height: KDimensions.ht20),
        SizedBox(
          height: KDimensions.ht190,
          width: KDimensions.screenWidth,
          child: ListView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: widget.starships.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.toStarshipsDetail(starshipEntityVal: widget.starships[index]));
                  },
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: KDimensions.wd10),
                      child: PhotoCard(
                        imageUrl: widget.starships[index].image,
                        title: widget.starships[index].name,
                      )),
                );
              }),
        ),
        SizedBox(height: KDimensions.ht30),
      ],
    );
  }
}
