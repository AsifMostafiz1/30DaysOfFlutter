import 'package:flutter/cupertino.dart';

abstract class PokemonEvent{
}

class PokemonPageLoadEvent extends PokemonEvent{
  final int page;

  PokemonPageLoadEvent({@required this.page});
}