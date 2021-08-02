import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/widgets/recipe_item.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key, required this.availableRecipes})
      : super(key: key);
  // static variables can be accessed without an instance
  static const String routeName = '/category-recipe';
  final List<Recipe> availableRecipes;

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  late String _title;
  late List<Recipe> _filteredRecipes;
  bool _loadedInitData = false;

  // called whenever state if fully initialized
  // when refs are changed too
  @override
  void didChangeDependencies() {
    // ! bang operator
    if (!_loadedInitData) {
      if (ModalRoute.of(context) != null) {
        final Map<String, String> routeArgs =
            ModalRoute.of(context)?.settings.arguments as Map<String, String>;
        final String id = routeArgs['id'].toString();
        _title = routeArgs['title'].toString();
        // filter the recipes from the data file by the id the category
        _filteredRecipes = widget.availableRecipes.where((Recipe recipe) {
          return recipe.categories.contains(id);
        }).toList();
        _loadedInitData = true;
      }
    }
    super.didChangeDependencies();
  }

  void _removeItem(String id) {
    setState(() {
      _filteredRecipes.removeWhere((Recipe element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ModalRoute uses context and enables acces to the arguments
    if (ModalRoute.of(context) == null) {
      return const SizedBox.shrink();
    }

    return Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return RecipeItem(
              id: _filteredRecipes[index].id,
              title: _filteredRecipes[index].title,
              imageUrl: _filteredRecipes[index].imageUrl,
              duration: _filteredRecipes[index].duration,
              complexity: _filteredRecipes[index].complexity,
              affordability: _filteredRecipes[index].affordability,
              removeItem: _removeItem,
            );
          },
          itemCount: _filteredRecipes.length,
        ));
  }
}
