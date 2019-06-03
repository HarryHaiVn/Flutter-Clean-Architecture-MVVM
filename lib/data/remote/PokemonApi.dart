import 'package:flutter_cleanarchitecture_mvvm/data/model/Pokemon.dart';

abstract class PokemonApi{
  Future<List<Pokemon>> getPokemonList();
}