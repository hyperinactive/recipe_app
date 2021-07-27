import 'package:flutter/material.dart';
import 'package:recipe_app/categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Recipes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Categories(key: UniqueKey()));
  }
}
