import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starwars/core/Routes/routes.dart';
import 'package:starwars/core/ext/image_ext.dart';
import 'package:starwars/core/utils/dimensions.dart';
import 'package:starwars/core/widgets/big_text.dart';
import 'package:starwars/src/domain/entities/categories_entity.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<CategoriesEntity> _categories = [
    CategoriesEntity(assetPath: "assets/characters.png", title: "CHARACTERS", route: AppRoutes.toCharacters()),
    CategoriesEntity(assetPath: "assets/films.png", title: "FILMS", route: AppRoutes.toFilms()),
    CategoriesEntity(assetPath: "assets/planets.png", title: "PLANETS", route: AppRoutes.toPlanets()),
    CategoriesEntity(assetPath: "assets/starships.png", title: "STARSHIPS", route: AppRoutes.toStarships()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(KDimensions.ht80),
          child: Center(
              child: Container(
                  width: KDimensions.wd390,
                  color: Colors.grey.shade300,
                  child: TextField(
                    decoration: InputDecoration(fillColor: Colors.grey.shade400),
                  ))),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(KDimensions.dim20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemCount: _categories.length,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, _categories[index].route);
            },
            child: Container(
              width: KDimensions.wd180,
              height: KDimensions.ht180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(KDimensions.dim10),
                border: Border.all(color: Colors.grey.shade700),
              ),
              child: Column(children: [
                Image.asset(
                  _categories[index].assetPath,
                  width: KDimensions.wd170,
                  height: KDimensions.ht170,
                  cacheHeight: KDimensions.wd170.cacheSize(context),
                  cacheWidth: KDimensions.wd170.cacheSize(context),
                ),
                BigText(title: _categories[index].title)
              ]),
            ),
          ),
        ));
  }
}
