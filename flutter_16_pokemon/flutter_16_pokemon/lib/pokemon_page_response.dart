import 'package:flutter/cupertino.dart';
/*{
     "count": 1118,
     "next": "https://pokeapi.co/api/v2/pokemon?offset=3&limit=3",
      "previous": null,
      "results": [
                  {
                    "name": "bulbasaur",
                    "url": "https://pokeapi.co/api/v2/pokemon/1/"
                   }
                 ]
}*/




class PokemonListing{
  final String name;
  final int id;
  //https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/132.png
  String get imageUrl => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/$id.png";

   PokemonListing({@required this.name,@required this.id});

   factory PokemonListing.fromJson(Map<String,dynamic> json) {
        final name = json['name'];
        final url = json['url'] as String;

        final id =  int.parse(url.split('/')[6]);

        return PokemonListing(name: name, id: id);
   }
}

class PokemonPageResponse{

  final List<PokemonListing> pokemonListing;
  final bool onNextPage;

  PokemonPageResponse({@required this.pokemonListing, @required this.onNextPage});

  factory PokemonPageResponse.fromJson(Map<String,dynamic> json){
    final onNextPage = json['next'] != null;
    final pokemonListing = (json['results'] as List)
        .map((listingJson) => PokemonListing.fromJson(listingJson)).toList();

    return PokemonPageResponse(pokemonListing: pokemonListing, onNextPage: onNextPage);
  }

}