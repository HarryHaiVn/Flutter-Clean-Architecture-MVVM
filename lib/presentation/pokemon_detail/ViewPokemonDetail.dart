import 'package:flutter/material.dart';

class ViewPokemonDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Demo',
      home: new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: new Text('Welcome To Pokemon Detail'),
        ),
        body: new Center(
          child: Text("Pokemon Detail"),
        ),
      ),
    );
  }
}
