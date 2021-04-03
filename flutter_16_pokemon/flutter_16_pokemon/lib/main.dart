import 'package:flutter/material.dart';
import 'package:flutter_16_pokemon/bloc/pokemon_bloc.dart';
import 'package:flutter_16_pokemon/bloc/pokemon_event.dart';
import 'package:flutter_16_pokemon/pokedex_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(primaryColor: Colors.red,accentColor: Colors.redAccent),

      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=> PokemonBloc()..add(PokemonPageLoadEvent(page: 0))),
        ],
          child: PokedexView()),
    );
  }
}