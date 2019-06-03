import 'package:flutter/material.dart';

Widget avatar(String url, MaterialColor color) {
  return new Material(
    borderRadius: new BorderRadius.circular(20.0),
    elevation: 3.0,
    child: url != null && url.isNotEmpty
        ? new CircleAvatar(child: new Image.network(url))
        : new CircleAvatar(
            child: new Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            backgroundColor: color,
          ),
  );
}
