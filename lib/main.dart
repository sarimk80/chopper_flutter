import 'package:chopper_flutter/src/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:equinox/equinox.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EquinoxApp(
      theme: EqThemes.defaultLightTheme,
      title: "Chopper",
      home: MyHomePage(
        title: "Flutter Chopper",
      ),
    );
  }
}
