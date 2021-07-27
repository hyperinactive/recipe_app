import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.title, required this.color, Key? key})
      : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(title),
      decoration: BoxDecoration(
          // gradient driection -> begin end
          gradient: LinearGradient(
            colors: <Color>[color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
