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
import 'package:starwars/src/presentation/widgets/planets_slider.dart';
import 'package:starwars/src/presentation/widgets/starships_slider.dart';

class FilmDetailPage extends StatefulWidget {
  final FilmEntity filmEntity;
  const FilmDetailPage({super.key, required this.filmEntity});

  @override
  State<FilmDetailPage> createState() => _FilmDetailPageState();
}

class _FilmDetailPageState extends State<FilmDetailPage> {
  List<CharacterEntity> characters = [];
  List<PlanetEntity> planets = [];
  List<StarshipEntity> starships = [];

  @override
  void initState() {
    // Nested requests approach
    context.read<StarwarsCubit>().getCharacters(GetCharacterParams(queryList: widget.filmEntity.characters));
    context.read<StarwarsCubit>().getPlanets(GetPlanetsParams(queryList: widget.filmEntity.planets));
    context.read<StarwarsCubit>().getStarships(GetStarshipsParams(queryList: widget.filmEntity.starships));

    // context.read<StarwarsCubit>().getFilms();
    // context.read<StarwarsCubit>().getStarships(const GetStarshipsParams(index: 0));
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

        if (state is GotStarships) {
          starships = state.starships;
        }
        if (state is GotPlanets) {
          planets = state.planets;
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: kMainColor,
            body: CustomScrollView(slivers: [
              CustomSilverAppBar(title: widget.filmEntity.title, image: widget.filmEntity.image),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(KDimensions.wd20),
                      child: BigText(title: widget.filmEntity.openingCraw, maxLines: 10),
                    ),
                    Padding(
                      padding: EdgeInsets.all(KDimensions.wd20),
                      child: BigText(title: "Director: ${widget.filmEntity.director}"),
                    ),
                    characters.isNotEmpty ? CharactersSlider(charactersList: characters) : AppCircularIndicator(),
                    if (planets.isNotEmpty) PlanetsSlider(planets: planets),
                    starships.isNotEmpty ? StarshipsSlider(starships: starships) : AppCircularIndicator(),
                  ],
                ),
              ),
            ]));
      },
    );
  }
}
