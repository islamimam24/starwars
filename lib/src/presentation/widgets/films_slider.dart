import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starwars/core/Routes/routes.dart';
import 'package:starwars/core/utils/dimensions.dart';
import 'package:starwars/core/widgets/big_text.dart';
import 'package:starwars/src/domain/entities/films_entity.dart';
import 'package:starwars/src/presentation/widgets/photo_card.dart';

class FilmsSlider extends StatefulWidget {
  final List<FilmEntity> films;
  const FilmsSlider({super.key, required this.films});

  @override
  State<FilmsSlider> createState() => _FilmsSliderState();
}

class _FilmsSliderState extends State<FilmsSlider> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: KDimensions.ht30),
        BigText(
          title: "Films",
          fontSize: KDimensions.dim16,
        ),
        SizedBox(height: KDimensions.ht20),
        SizedBox(
          height: KDimensions.ht190,
          width: KDimensions.screenWidth,
          child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: widget.films.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.toFilmDetail(filmEntityval: widget.films[index]));
                  },
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: KDimensions.wd10),
                      child: PhotoCard(
                        imageUrl: widget.films[index].image,
                        title: widget.films[index].title,
                      )),
                );
              }),
        ),
        SizedBox(height: KDimensions.ht30),
      ],
    );
  }
}
