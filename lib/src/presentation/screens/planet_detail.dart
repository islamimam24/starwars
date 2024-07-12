import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/core/utils/colors.dart';
import 'package:starwars/core/utils/dimensions.dart';
import 'package:starwars/core/widgets/app_circular_indecator.dart';
import 'package:starwars/core/widgets/big_text.dart';
import 'package:starwars/src/domain/entities/character_entity.dart';
import 'package:starwars/src/domain/entities/films_entity.dart';
import 'package:starwars/src/domain/entities/planets_entity.dart';
import 'package:starwars/src/domain/entities/starships_entity.dart';
import 'package:starwars/src/domain/usecases/get_characters.dart';
import 'package:starwars/src/domain/usecases/get_planets.dart';
import 'package:starwars/src/domain/usecases/get_starhips.dart';
import 'package:starwars/src/presentation/cubit/starwars_cubit.dart';
import 'package:starwars/src/presentation/widgets/characters_slider.dart';
import 'package:starwars/src/presentation/widgets/custom_silver_app_bar.dart';
import 'package:starwars/src/presentation/widgets/films_slider.dart';
import 'package:starwars/src/presentation/widgets/planets_slider.dart';
import 'package:starwars/src/presentation/widgets/starships_slider.dart';

class PlanetDetailPage extends StatefulWidget {
  final PlanetEntity planetEntity;
  const PlanetDetailPage({super.key, required this.planetEntity});

  @override
  State<PlanetDetailPage> createState() => _PlanetDetailPageState();
}

class _PlanetDetailPageState extends State<PlanetDetailPage> {
  List<CharacterEntity> characters = [];
  List<FilmEntity> films = [];

  @override
  void initState() {
    // Nested requests approach
    context.read<StarwarsCubit>().getCharacters(GetCharacterParams(queryList: widget.planetEntity.characters));
    context.read<StarwarsCubit>().getFilms(queryList: widget.planetEntity.films);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StarwarsCubit, StarwarsState>(
      listener: (context, state) {
        // Nested requests appraoch
        if (state is GotCharacters) {
          characters = state.charactersList;
        }

        if (state is GotFilms) {
          films = state.films;
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: kMainColor,
            body: CustomScrollView(slivers: [
              CustomSilverAppBar(title: widget.planetEntity.name, image: widget.planetEntity.image),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(KDimensions.wd20),
                      child: BigText(title: "Climate: ${widget.planetEntity.climate}"),
                    ),
                    if (characters.isNotEmpty) CharactersSlider(charactersList: characters),
                    if (films.isNotEmpty) FilmsSlider(films: films),
                  ],
                ),
              ),
            ]));
      },
    );
  }
}
