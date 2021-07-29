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
        // blue gray theme
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.lightBlueAccent,
            canvasColor: const Color.fromRGBO(220, 251, 251, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(color: Colors.deepOrange),
                bodyText2: const TextStyle(color: Colors.deepOrange),
                headline6: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ))),
        home: Categories(key: UniqueKey()));
  }
}
