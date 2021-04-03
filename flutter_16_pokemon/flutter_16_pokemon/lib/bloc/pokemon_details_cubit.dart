import 'package:flutter_16_pokemon/data/pokemon_details.dart';
import 'package:flutter_16_pokemon/data/pokemon_info_response.dart';
import 'package:flutter_16_pokemon/data/pokemon_reposotory.dart';
import 'package:flutter_16_pokemon/data/pokemon_species_info_reponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails>{

  final _pokemonRepository = PokemonRepository();
  PokemonDetailsCubit(): super (null);

  void getPokemonDetails(int pokemonId) async{
    final response = await Future.wait(
      [
        _pokemonRepository.getPokemonInfo(pokemonId),
        _pokemonRepository.getPokemonSpeciesInfo(pokemonId)
      ]
    );

    final pokemonInfo = response[0] as PokemonInfoResponse;
    final pokemonSpeciesInfo = response[1] as PokemonSpeciesInfoResponse;


    emit(PokemonDetails(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        description: pokemonSpeciesInfo.description));
  }

  void clearPokemonDetails(){
    emit(null);
}
}