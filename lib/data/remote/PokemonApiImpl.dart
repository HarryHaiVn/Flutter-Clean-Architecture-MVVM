import 'package:flutter_cleanarchitecture_mvvm/data/model/Pokemon.dart';
import 'package:flutter_cleanarchitecture_mvvm/data/remote/PokemonApi.dart';
import 'package:http/http.dart';
import 'dart:convert';

class PokemonApiImpl implements PokemonApi {
  @override
  Future<List<Pokemon>> getPokemonList() async {
    try{
      final response = await get('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
      if (response.statusCode == 200) {
        Map<String, dynamic> mapResponse = json.decode(response.body);
        var list = mapResponse['pokemon'] as List;
        List<Pokemon> listPokemon = List();
        for (var idx=0;idx<list.length;idx++) {
          Pokemon pokemon = Pokemon();
          pokemon.name = list.asMap()[idx]['name'];
          pokemon.url = list.asMap()[idx]['img'];
          listPokemon.add(pokemon);
        }
        return listPokemon;
      }else{
        throw Exception("Error Code: ${response.statusCode}");
      }
    }catch(e){
      throw Exception("There was a problem with the connection");
    }
  }
}
