import 'package:flutter/material.dart';
import 'package:flutter_16_pokemon/bloc/pokemon_bloc.dart';
import 'package:flutter_16_pokemon/bloc/pokemon_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PokedexView extends StatefulWidget {
  @override
  _PokedexViewState createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon"),
        centerTitle: true,
      ),
      body: BlocBuilder<PokemonBloc,PokemonState>(
        builder: (context,state){
          if (state is PokemonLoadInProgressState)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          else if(state is PokemonLoadSuccessState)
            {
              return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: state.pokemonListing.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: GridTile(
                        child: Column(
                          children: [
                            Image.network(state.pokemonListing[index].imageUrl),
                            Text(state.pokemonListing[index].name),
                          ],
                        ),
                      ),
                    );
                  },
              );

            }

          else if(state is PokemonLoadFailureState)
            {
              return Center(
                child: Text(state.error.toString()),
              );
            }
          else{
            return Container();
          }
        },
      ),
    );
  }
}
