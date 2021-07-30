import 'package:flutter/material.dart';
import 'package:recipe_app/dummy_data.dart';
import 'package:recipe_app/models/recipe.dart';

class CategoryRecipe extends StatelessWidget {
  const CategoryRecipe({Key? key}) : super(key: key);
  // static variables can be accessed without an instance
  static const String routeName = '/category-recipe';

  @override
  Widget build(BuildContext context) {
    // ModalRoute uses context and enables acces to the arguments
    if (ModalRoute.of(context) == null) {
      return const SizedBox.shrink();
    }
    // ! bang operator
    final Map<String, String> routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String id = routeArgs['id'].toString();
    final String title = routeArgs['title'].toString();

    // filter the recipes from the data file by the id the category
    final List<Recipe> filteredRecipes = dummyRecipes.where((Recipe recipe) {
      return recipe.categories.contains(id);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Text(filteredRecipes[index].title);
          },
          itemCount: filteredRecipes.length,
        ));
  }
}
