import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starwars/core/Routes/routes.dart';
import 'package:starwars/core/utils/dimensions.dart';
import 'package:starwars/core/widgets/big_text.dart';
import 'package:starwars/src/domain/entities/character_entity.dart';
import 'package:starwars/src/domain/entities/films_entity.dart';
import 'package:starwars/src/presentation/widgets/photo_card.dart';

class CharactersSlider extends StatefulWidget {
  final List<CharacterEntity> charactersList;
  const CharactersSlider({super.key, required this.charactersList});

  @override
  State<CharactersSlider> createState() => _CharactersSliderState();
}

class _CharactersSliderState extends State<CharactersSlider> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: KDimensions.ht30),
        BigText(
          title: "Characters",
          fontSize: KDimensions.dim16,
        ),
        SizedBox(height: KDimensions.ht20),
        SizedBox(
          height: KDimensions.ht190,
          width: KDimensions.screenWidth,
          child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: widget.charactersList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.toCharacterDetails(characterEntityVal: widget.charactersList[index]));
                  },
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: KDimensions.wd10),
                      child: PhotoCard(
                        imageUrl: widget.charactersList[index].image,
                        title: widget.charactersList[index].name,
                      )),
                );
              }),
        ),
        SizedBox(height: KDimensions.ht30),
      ],
    );
  }
}
