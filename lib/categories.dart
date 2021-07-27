import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      children: [],
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
