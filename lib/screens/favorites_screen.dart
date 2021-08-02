import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/widgets/recipe_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key, required this.favoriteRecipes})
      : super(key: key);
  final List<Recipe> favoriteRecipes;

  @override
  Widget build(BuildContext context) {
    // no need for a scaffold cause its a "subscreen" tab
    // the TabBar and TabBarView controll the appbar stuff already
    if (favoriteRecipes.isEmpty) {
      return const Center(
        child: Text('No favorites, yet'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return RecipeItem(
            id: favoriteRecipes[index].id,
            title: favoriteRecipes[index].title,
            imageUrl: favoriteRecipes[index].imageUrl,
            duration: favoriteRecipes[index].duration,
            complexity: favoriteRecipes[index].complexity,
            affordability: favoriteRecipes[index].affordability,
          );
        },
        itemCount: favoriteRecipes.length,
      );
    }
  }
}
