import 'package:flutter/material.dart';
import 'package:flutter_16_pokemon/bloc/app_navigator.dart';
import 'package:flutter_16_pokemon/bloc/nav_cubit.dart';
import 'package:flutter_16_pokemon/bloc/pokemon_bloc.dart';
import 'package:flutter_16_pokemon/bloc/pokemon_details_cubit.dart';
import 'package:flutter_16_pokemon/bloc/pokemon_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MaterialApp(
      theme: Theme.of(context).copyWith(primaryColor: Colors.red,accentColor: Colors.redAccent),

      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=> PokemonBloc()..add(PokemonPageLoadEvent(page: 0))),
          BlocProvider(create: (context)=>NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
          BlocProvider(create: (context)=> pokemonDetailsCubit)
        ],child: AppNavigator()),
    );
  }
}