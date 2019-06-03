import 'package:flutter_cleanarchitecture_mvvm/data/model/Pokemon.dart';
import 'package:flutter_cleanarchitecture_mvvm/data/remote/PokemonApiImpl.dart';
import 'package:flutter_cleanarchitecture_mvvm/domain/GetPokemonListUseCase.dart';
import 'package:flutter_cleanarchitecture_mvvm/data/repository/PokemonRepositoryImpl.dart';
import 'package:rxdart/rxdart.dart';

class ViewModelPokemonList {
  var pokemonListSubject = PublishSubject<List<Pokemon>>();

  Observable<List<Pokemon>> get pokemonList => pokemonListSubject.stream;
  GetPokemonListUseCase getPokemonListUseCase =
      GetPokemonListUseCase(PokemonRepositoryImpl(PokemonApiImpl()));

  void getPokemonList() async {
    try {
      pokemonListSubject = PublishSubject<List<Pokemon>>();
      pokemonListSubject.sink.add(await getPokemonListUseCase.perform());
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      pokemonListSubject.sink.addError(e);
    }
  }

  void closeObservable() {
    pokemonListSubject.close();
  }
}
