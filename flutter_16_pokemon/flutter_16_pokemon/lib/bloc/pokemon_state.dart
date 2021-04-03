import 'package:flutter/cupertino.dart';
import 'file:///E:/30DaysOfFlutter/flutter_16_pokemon/flutter_16_pokemon/lib/data/pokemon_page_response.dart';

abstract class PokemonState{
}

class PokemonInitialState extends PokemonState{
}

class PokemonLoadInProgressState extends PokemonState {
}

class PokemonLoadSuccessState extends PokemonState
{
  final List<PokemonListing> pokemonListing;

  final bool canLoadNextPage;

  PokemonLoadSuccessState({@required this.canLoadNextPage,@required this.pokemonListing});
}

class PokemonLoadFailureState extends PokemonState{
  final Error error;

  PokemonLoadFailureState(@required this.error);
}