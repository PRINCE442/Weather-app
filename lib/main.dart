import 'package:flutter/material.dart';
import 'package:climate_app/Screens/loading_screen.dart';

void main() => runApp(climate_app());

class climate_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}