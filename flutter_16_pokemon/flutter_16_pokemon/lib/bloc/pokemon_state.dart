import 'package:flutter/cupertino.dart';
import 'package:flutter_16_pokemon/pokemon_page_response.dart';

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