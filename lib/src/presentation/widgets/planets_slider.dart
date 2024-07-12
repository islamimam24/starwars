import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starwars/core/Routes/routes.dart';
import 'package:starwars/core/utils/dimensions.dart';
import 'package:starwars/core/widgets/big_text.dart';
import 'package:starwars/src/domain/entities/films_entity.dart';
import 'package:starwars/src/domain/entities/planets_entity.dart';
import 'package:starwars/src/presentation/widgets/photo_card.dart';

class PlanetsSlider extends StatefulWidget {
  final List<PlanetEntity> planets;
  const PlanetsSlider({super.key, required this.planets});

  @override
  State<PlanetsSlider> createState() => _PlanetsSliderState();
}

class _PlanetsSliderState extends State<PlanetsSlider> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: KDimensions.ht30),
        BigText(
          title: "Planets",
          fontSize: KDimensions.dim16,
        ),
        SizedBox(height: KDimensions.ht20),
        SizedBox(
          height: KDimensions.ht190,
          width: KDimensions.screenWidth,
          child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: widget.planets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.toPlanetsDetail(planetEntityVal: widget.planets[index]));
                  },
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: KDimensions.wd10),
                      child: PhotoCard(
                        imageUrl: widget.planets[index].image,
                        title: widget.planets[index].name,
                      )),
                );
              }),
        ),
        SizedBox(height: KDimensions.ht30),
      ],
    );
  }
}
