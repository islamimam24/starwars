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

class FilmsScr extends StatefulWidget {
  const FilmsScr({
    super.key,
  });

  @override
  State<FilmsScr> createState() => _FilmsScrState();
}

class _FilmsScrState extends State<FilmsScr> {
  final _scrollController = ScrollController();

  List<FilmEntity> films = [];

// Switch()

  @override
  void initState() {
    super.initState();
    context.read<StarwarsCubit>().getFilms();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StarwarsCubit, StarwarsState>(listener: (context, state) {
      if (state is FailedGettingCharacters) {
        print('debugPrint: FailedGettingCharacters');
      }
      if (state is GotFilms) {
        films.addAll(state.films);
      }
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.black87,
          appBar: customAppBar(context: context, title: "FILMS"),
          body: state is GettingFilms && films.isEmpty
              ? const AppCircularIndicator()
              : GridView.builder(
                  controller: _scrollController,
                  itemCount: films.length,
                  padding: EdgeInsets.all(KDimensions.dim20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.toFilmDetail(filmEntityval: films[index]));
                        },
                        child: PhotoCard(
                          imageUrl: films[index].image,
                          title: films[index].title,
                        ));
                  },
                ));
    });
  }
}
