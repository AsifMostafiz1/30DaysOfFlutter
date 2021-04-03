import 'dart:convert';

import 'package:flutter_16_pokemon/pokemon_page_response.dart';
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
}