import 'package:flutter/material.dart';

class CategoryRecipe extends StatelessWidget {
  const CategoryRecipe({required this.id, required this.title, Key? key})
      : super(key: key);

  final String id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('Recipe screen'),
      ),
    );
  }
}
