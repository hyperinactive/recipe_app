import 'package:flutter/material.dart';
import 'package:recipe_app/dummy_data.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen(
      {Key? key, required this.toggleFavorite, required this.isFavorite})
      : super(key: key);
  static const String routeName = '/recipe-details';
  final Function toggleFavorite;
  final Function isFavorite;

  // builder methods are fine
  // alternatively, a new file with a widget can be created
  Widget buildTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String recipeId =
        ModalRoute.of(context)?.settings.arguments as String;
    // firstWhere will try to match the first element and then break
    final Recipe selectedRecipe =
        dummyRecipes.firstWhere((Recipe element) => element.id == recipeId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedRecipe.title)),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.network(selectedRecipe.imageUrl, fit: BoxFit.cover),
          ),
          buildTitle(context, 'Ingredients'),
          buildContainer(ListView.builder(
            itemBuilder: (BuildContext context, int index) => Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(selectedRecipe.ingredients[index]),
              ),
            ),
            itemCount: selectedRecipe.ingredients.length,
          )),
          buildTitle(context, 'Steps'),
          buildContainer(ListView.builder(
            itemBuilder: (BuildContext context, int index) => Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(selectedRecipe.steps[index]),
                ),
                const Divider(),
              ],
            ),
            itemCount: selectedRecipe.steps.length,
          ))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child:
            Icon(isFavorite(recipeId) as bool ? Icons.star : Icons.star_border),
        // onPressed: () {
        //   // return to the previous screen
        //   // can also pass data through the pop method
        //   Navigator.of(context).pop(recipeId);
        // },
        onPressed: () => toggleFavorite(recipeId),
      ),
    );
  }
}
