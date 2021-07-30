import 'package:flutter/material.dart';
import 'package:recipe_app/category__recipe.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {required this.id, required this.title, required this.color, Key? key})
      : super(key: key);

  final String id;
  final String title;
  final Color color;

  void selectCategory(BuildContext context) {
    // navigator helps navigation between screens
    // needs context, uses stack to store pages
    // needs PageRoute class
    // _ => context (which isn't needed here)
    // auto adds a "<-" button in the app bar
    // Navigator.of(context).push(MaterialPageRoute<void>(
    //   builder: (_) {
    //     return CategoryRecipe(
    //       id: id,
    //       title: title,
    //     );
    //   },
    // ));
    // ------------------------------------------------------------

    // push just like web dev routes
    Navigator.of(context).pushNamed(
      CategoryRecipe.routeName,
      // TODO(annotation): <Object> no good here?
      arguments: <String, String>{'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    // inkwell is a gesture detector that fires off a ripple effect
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          // access the global theme style and apply TextStyle
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            // gradient driection -> begin end
            gradient: LinearGradient(
              colors: <Color>[color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
