import 'package:flutter/material.dart';
import 'package:flutter_cleanarchitecture_mvvm/presentation/pokemon_list/ViewPokemonList.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViewPokemonList()
    );
  }
}
