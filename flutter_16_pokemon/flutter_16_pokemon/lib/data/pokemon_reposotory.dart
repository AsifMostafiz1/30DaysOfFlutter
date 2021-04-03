import 'dart:convert';

import 'file:///E:/30DaysOfFlutter/flutter_16_pokemon/flutter_16_pokemon/lib/data/pokemon_page_response.dart';
import 'package:flutter_16_pokemon/data/pokemon_info_response.dart';
import 'package:flutter_16_pokemon/data/pokemon_species_info_reponse.dart';
import 'package:http/http.dart' as http;
class PokemonRepository{
  //https://pokeapi.co/api/v2/pokemon?limit=200&offset=0

  final _baseUrl ="pokeapi.co";
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    final queryParameter ={
      'limit':'200',
      'offset': (pageIndex*200).toString()
    };

    final uri = Uri.https(_baseUrl,"/api/v2/pokemon",queryParameter);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJson(json);
  }

  Future<PokemonInfoResponse> getPokemonInfo(int pokemonId) async
  {
    final uri = Uri.https(_baseUrl,"/api/v2/pokemon/$pokemonId");
    try{
        final response = await http.get(uri);
        final json = jsonDecode(response.body);
        return PokemonInfoResponse.fromJson(json);
    }catch(e)
    {
      print(e);
    }
  }


  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfo(int pokemonId) async
  {
    final uri = Uri.https(_baseUrl,"/api/v2/pokemon-species/$pokemonId");
    try{
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return PokemonSpeciesInfoResponse.fromJson(json);
    }catch(e)
    {
      print(e);
    }
  }
}