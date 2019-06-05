import 'package:flutter/material.dart';
import 'package:flutter_cleanarchitecture_mvvm/presentation/camera/camera_screen.dart';
import 'package:flutter_cleanarchitecture_mvvm/presentation/photo/ViewPhotoStaggered.dart';
import 'package:flutter_cleanarchitecture_mvvm/presentation/pokemon_list/ViewPokemonGrid.dart';
import 'package:flutter_cleanarchitecture_mvvm/presentation/pokemon_list/ViewPokemonList.dart';

class PokemonHome extends StatefulWidget {
  var cameras;

  PokemonHome(this.cameras);

  @override
  _PokemonHomeState createState() => new _PokemonHomeState();
}

class _PokemonHomeState extends State<PokemonHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Go"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: "LIST"),
            new Tab(
              text: "GRID",
            ),
            new Tab(
              text: "STAGGER",
            ),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          new Icon(Icons.more_vert)
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new CameraScreen(widget.cameras),
          new ViewPokemonList(),
          new ViewPokemonGrid(),
          new ViewPhotoStaggered(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: new Icon(
            Icons.message,
            color: Colors.white,
          ),
          onPressed: () => _showToast(context)),
    );
  }

  _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Hello!'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
