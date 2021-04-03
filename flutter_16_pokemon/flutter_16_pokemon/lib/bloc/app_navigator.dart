import 'package:flutter/material.dart';
import 'package:flutter_16_pokemon/bloc/nav_cubit.dart';
import 'package:flutter_16_pokemon/pokedex_view.dart';
import 'package:flutter_16_pokemon/pokemon_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit,int>(builder: (context,pokemonId){
      return Navigator(
        pages: [
                MaterialPage(child: PokedexView()),
          if(pokemonId!=null) MaterialPage(child: PokemonDetailsPage())
        ],
        onPopPage: (route,result){
          BlocProvider.of<NavCubit>(context).popToPokeDex();
          return route.didPop(result);
        },
      );
    });
  }
}
