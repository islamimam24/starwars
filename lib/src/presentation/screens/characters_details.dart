import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/core/utils/colors.dart';
import 'package:starwars/core/utils/dimensions.dart';
import 'package:starwars/core/widgets/big_text.dart';

import 'package:starwars/src/domain/entities/character_entity.dart';
import 'package:starwars/src/domain/entities/films_entity.dart';
import 'package:starwars/src/domain/entities/starships_entity.dart';
import 'package:starwars/src/domain/usecases/get_starhips.dart';
import 'package:starwars/src/presentation/cubit/starwars_cubit.dart';
import 'package:starwars/src/presentation/widgets/custom_silver_app_bar.dart';
import 'package:starwars/src/presentation/widgets/films_slider.dart';
import 'package:starwars/src/presentation/widgets/photo_card.dart';
import 'package:starwars/src/presentation/widgets/starships_slider.dart';

class CharacterDetails extends StatefulWidget {
  final CharacterEntity characterEntity;
  const CharacterDetails({super.key, required this.characterEntity});

  @override
  State<CharacterDetails> createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  List<FilmEntity> films = [];
  // List<PlanetsEntity> planets = [];
  List<StarshipEntity> starships = [];
  ScrollController _filmsScrollController = ScrollController();
  ScrollController _starshipsScrollController = ScrollController();
  @override
  void initState() {
    // Nested requests approach
    context.read<StarwarsCubit>().getFilms(queryList: widget.characterEntity.films);
    context.read<StarwarsCubit>().getStarships(GetStarshipsParams(queryList: widget.characterEntity.starships));

    // context.read<StarwarsCubit>().getFilms();
    // context.read<StarwarsCubit>().getStarships(const GetStarshipsParams(index: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StarwarsCubit, StarwarsState>(
      listener: (context, state) {
        // Nested requests appraoch
        if (state is GotFilms) {
          films = state.films;
        }

        if (state is GotStarships) {
          starships = state.starships;
        }

        // if (state is GotFilms) {
        //   films = state.films;
        //   List<String> filmsIndexList = widget.characterEntity.films!.map((e) => e[e.length - 2]).toList();
        //   films = state.films.where((element) => filmsIndexList.contains(element.url[element.url.length - 2])).toList();
        // }

        // if (state is GotStarships) {
        //   List<String> starshipsIndexList = widget.characterEntity.starships!.map((e) => e[e.length - 2]).toList();
        //   starships = state.starships
        //       .where((element) => starshipsIndexList.contains(element.url[element.url.length - 2]))
        //       .toList();
        // }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: kMainColor,
            body: CustomScrollView(slivers: [
              CustomSilverAppBar(title: widget.characterEntity.name, image: widget.characterEntity.image),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: KDimensions.wd20),
                        child: Column(
                          children: [
                            SizedBox(height: KDimensions.ht40),
                            InfoRow(
                              title: const ["Gender", "Birth year"],
                              value: [
                                widget.characterEntity.gender.toString(),
                                widget.characterEntity.birthYear.toString()
                              ],
                            ),
                            InfoRow(
                              title: const ["Height", "mass"],
                              value: [widget.characterEntity.height.toString(), widget.characterEntity.mass.toString()],
                            ),
                            InfoRow(
                              title: const ["Hair Color", "Skin color"],
                              value: [
                                widget.characterEntity.hairColor.toString(),
                                widget.characterEntity.skinColor.toString()
                              ],
                            ),
                          ],
                        )),
                    SizedBox(height: KDimensions.ht50),
                    // Films
                    if (films.isNotEmpty) FilmsSlider(films: films),

                    // Starships
                    if (starships.isNotEmpty) StarshipsSlider(starships: starships)
                  ],
                ),
              ),
            ]));
      },
    );
  }
}

class InfoRow extends StatelessWidget {
  final List<String> title;

  final List<String> value;

  const InfoRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: KDimensions.ht10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
              2,
              ((index) => SizedBox(
                    width: KDimensions.wd390 / 2,
                    child: BigText(title: "${title[index]}: ${value[index]}"),
                  )))),
    );
  }
}
