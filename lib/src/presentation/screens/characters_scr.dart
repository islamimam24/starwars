import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/core/Routes/routes.dart';
import 'package:starwars/core/enums/navigation.dart';
import 'package:starwars/core/ext/image_ext.dart';
import 'package:starwars/core/utils/colors.dart';
import 'package:starwars/core/utils/dimensions.dart';
import 'package:starwars/core/widgets/app_circular_indecator.dart';
import 'package:starwars/core/widgets/big_text.dart';
import 'package:starwars/core/widgets/custom_app_bar.dart';
import 'package:starwars/core/widgets/error_snackar.dart';
import 'package:starwars/main.dart';
import 'package:starwars/src/domain/entities/character_entity.dart';
import 'package:starwars/src/domain/entities/films_entity.dart';
import 'package:starwars/src/domain/entities/planets_entity.dart';
import 'package:starwars/src/domain/entities/starships_entity.dart';
import 'package:starwars/src/domain/usecases/get_characters.dart';
import 'package:starwars/src/presentation/cubit/starwars_cubit.dart';
import 'package:starwars/src/presentation/widgets/photo_card.dart';

class CharactersScr extends StatefulWidget {
  const CharactersScr({super.key});

  @override
  State<CharactersScr> createState() => _CharactersScrState();
}

class _CharactersScrState extends State<CharactersScr> {
  final _scrollController = ScrollController();
  final _list = <String>[];
  List<CharacterEntity> charactersList = [];
  List<PlanetEntity> planets = [];
  List<StarshipEntity> starships = [];
  List<FilmEntity> films = [];
  int _currentPage = 1;

// Switch()

  @override
  void initState() {
    super.initState();
    context.read<StarwarsCubit>().getCharacters(GetCharacterParams(index: _currentPage, queryList: []));
    _scrollController.addListener(_loadMore);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMore() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _currentPage++;
      context.read<StarwarsCubit>().getCharacters(GetCharacterParams(index: _currentPage, queryList: []));
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 2),
        curve: Curves.bounceOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StarwarsCubit, StarwarsState>(listener: (context, state) {
      if (state is FailedGettingCharacters) {
        print('debugPrint: FailedGettingCharacters');
      }
      if (state is GotCharacters) {
        charactersList.addAll(state.charactersList);
      }
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.black87,
          appBar: customAppBar(context: context, title: "CHARACTERS"),
          body: state is GettingCharacters && charactersList.isEmpty
              ? const AppCircularIndicator()
              : GridView.builder(
                  controller: _scrollController,
                  itemCount: charactersList.length,
                  padding: EdgeInsets.all(KDimensions.dim20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.toCharacterDetails(characterEntityVal: charactersList[index]));
                        },
                        child: PhotoCard(
                          imageUrl: charactersList[index].image,
                          title: charactersList[index].name,
                        ));
                  },
                ));
    });
  }
}
