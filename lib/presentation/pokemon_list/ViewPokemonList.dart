import 'package:flutter/material.dart';
import 'package:flutter_cleanarchitecture_mvvm/data/model/Pokemon.dart';
import 'package:flutter_cleanarchitecture_mvvm/data/widget/mp_circle_avatar.dart';
import 'package:flutter_cleanarchitecture_mvvm/presentation/pokemon_list/ViewModelPokemonList.dart';
import 'package:connectivity/connectivity.dart';

class ViewPokemonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Example"),
        ),
        body: buildPokemonContent());
  }

  Widget buildPokemonContent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildTitleWidget(),
          PokemonListView(),
        ],
      ),
    );
  }

  Widget buildTitleWidget() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text("Pokemon List"),
      ),
    );
  }
}

class PokemonListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PokemonListViewState();
  }
}

class PokemonListViewState extends State<PokemonListView>
    with WidgetsBindingObserver {
  final ViewModelPokemonList viewModelPokemonList = ViewModelPokemonList();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      refresh();
    }
  }

  @override
  void initState() {
    super.initState();
    refresh();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        refresh();
      }
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    viewModelPokemonList.closeObservable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Pokemon>>(
      stream: viewModelPokemonList.pokemonList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildCircularProgressIndicatorWidget();
        }
        if (snapshot.hasError) {
          showSnackBar(context, snapshot.error.toString());
          return buildListViewNoDataWidget();
        }
        if (snapshot.connectionState == ConnectionState.active) {
          var pokemonList = snapshot.data;
          if (null != pokemonList)
            return buildListViewWidget(pokemonList);
          else
            return buildListViewNoDataWidget();
        }
      },
    );
  }

  Widget buildListViewWidget(List<Pokemon> pokemonList) {
    final List<MaterialColor> _colors = Colors.primaries;
    return Flexible(
      child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: pokemonList.length,
          itemBuilder: (BuildContext context, int index) {
            var item = pokemonList[index];
            final MaterialColor color = _colors[index % _colors.length];
            return new ListTile(
              dense: false,
              leading: new Hero(
                child: avatar(item.url, color),
                tag: item.name,
              ),
              title: new Text(item.name),
              subtitle: new Text(
                "By ${item.name}",
                style: Theme
                    .of(context)
                    .textTheme
                    .caption,
              ),
            );
          }),
    );
  }

  Widget buildListViewNoDataWidget() {
    return Expanded(
      child: Center(
        child: Text("No Data Available"),
      ),
    );
  }

  Widget buildCircularProgressIndicatorWidget() {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void showSnackBar(BuildContext context, String errorMessage) async {
    await Future.delayed(Duration.zero);
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
  }

  void refresh() {
    viewModelPokemonList.getPokemonList();
    setState(() {});
  }
}
