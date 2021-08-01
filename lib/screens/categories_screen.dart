import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/category_item.dart';
import 'package:recipe_app/dummy_data.dart';
import 'package:recipe_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const String routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: <Widget>[
        ...dummyCategoriesList
            .map((Category category) => CategoryItem(
                key: ValueKey<String>(category.id),
                id: category.id,
                title: category.title,
                color: category.color))
            .toList()
      ],
      // Creates a delegate that makes grid layouts with tiles that have a maximum cross-axis extent
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // max width of an item
        childAspectRatio: 1.5, // aspect
        crossAxisSpacing: 20, // gap
        mainAxisSpacing: 20, // gap
      ),
    );
  }
}
