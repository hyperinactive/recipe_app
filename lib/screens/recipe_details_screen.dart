import 'package:flutter/material.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({Key? key}) : super(key: key);
  static const String routeName = '/recipe-details';

  @override
  Widget build(BuildContext context) {
    final String recipeId =
        ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(recipeId)),
      body: Center(
        child: Text(recipeId),
      ),
    );
  }
}
