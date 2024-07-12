part of 'starwars_cubit.dart';

class StarwarsState extends Equatable {
  const StarwarsState();

  @override
  List<Object> get props => [];
}

class StarwarsInitial extends StarwarsState {}

class GettingCharacters extends StarwarsState {
  const GettingCharacters();
}

class FailedGettingCharacters extends StarwarsState {
  const FailedGettingCharacters();
}

class GotCharacters extends StarwarsState {
  final List<CharacterEntity> charactersList;
  const GotCharacters(this.charactersList);
  @override
  List<Object> get props => [charactersList];
}

class GettingFilms extends StarwarsState {
  const GettingFilms();
}

class FailedGettingFilms extends StarwarsState {
  const FailedGettingFilms();
}

class GotFilms extends StarwarsState {
  final List<FilmEntity> films;
  const GotFilms(this.films);
  @override
  List<Object> get props => [films];
}

//-
class GettingPlanets extends StarwarsState {
  const GettingPlanets();
}

class FailedGettingPlanets extends StarwarsState {
  const FailedGettingPlanets();
}

class GotPlanets extends StarwarsState {
  final List<PlanetEntity> planets;
  const GotPlanets(this.planets);
  @override
  List<Object> get props => [planets];
}

//-
class GettingStarships extends StarwarsState {
  const GettingStarships();
}

class FailedGettingStarships extends StarwarsState {
  const FailedGettingStarships();
}

class GotStarships extends StarwarsState {
  final List<StarshipEntity> starships;
  const GotStarships(this.starships);
  @override
  List<Object> get props => [starships];
}
