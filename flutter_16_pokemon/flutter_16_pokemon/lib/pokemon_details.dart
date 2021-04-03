import 'package:flutter/material.dart';
import 'package:flutter_16_pokemon/bloc/pokemon_details_cubit.dart';
import 'package:flutter_16_pokemon/data/pokemon_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

class PokemonDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
          centerTitle: true,
        ),
        body: BlocBuilder<PokemonDetailsCubit,PokemonDetails>(
            builder: (context,details) {
             return details!=null
                 ? Center(child: Text(details.name),)
                 : Center(child: CircularProgressIndicator(),);
        }),
    );
  }
}
