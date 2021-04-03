import 'package:flutter_16_pokemon/bloc/pokemon_event.dart';
import 'package:flutter_16_pokemon/bloc/pokemon_state.dart';
import 'package:flutter_16_pokemon/pokemon_reposotory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitialState());

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonPageLoadEvent) {
      yield PokemonLoadInProgressState();

      try {
        final pokemonResponsePage = await _pokemonRepository.getPokemonPage(event.page);
        yield PokemonLoadSuccessState(
            canLoadNextPage: pokemonResponsePage.onNextPage,
            pokemonListing: pokemonResponsePage.pokemonListing);
      } catch (e) {
        yield PokemonLoadFailureState(e);
      }
    }
  }
}
