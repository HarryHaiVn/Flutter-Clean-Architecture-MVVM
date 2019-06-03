import 'package:flutter_cleanarchitecture_mvvm/data/model/Pokemon.dart';

abstract class PokemonRepository{
  Future<List<Pokemon>> getPokemonList();
}