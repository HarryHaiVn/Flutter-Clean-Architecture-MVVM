import 'package:flutter_cleanarchitecture_mvvm/data/model/Pokemon.dart';
import 'package:flutter_cleanarchitecture_mvvm/data/remote/PokemonApi.dart';
import 'package:flutter_cleanarchitecture_mvvm/data/repository/PokemonRepository.dart';

class PokemonRepositoryImpl implements PokemonRepository{
  PokemonApi pokemonApi;
  PokemonRepositoryImpl(PokemonApi pokemonApi){
    this.pokemonApi = pokemonApi;
  }

  @override
  Future<List<Pokemon>> getPokemonList() {
    return pokemonApi.getPokemonList();
  }
}