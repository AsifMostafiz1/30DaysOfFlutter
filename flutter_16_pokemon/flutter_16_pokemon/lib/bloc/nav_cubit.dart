import 'package:flutter/cupertino.dart';
import 'package:flutter_16_pokemon/bloc/pokemon_details_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<int>{
  PokemonDetailsCubit pokemonDetailsCubit;
  NavCubit({@required this.pokemonDetailsCubit}): super(null);

  void showDetailsPokemon(int pokemonId){
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
    emit(pokemonId);
  }
  void popToPokeDex(){
    emit(null);
}
}