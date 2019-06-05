import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'presentation/home/PokemonHome.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PokemonHome(cameras)
    );
  }
}
