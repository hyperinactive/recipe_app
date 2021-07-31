import 'package:flutter/material.dart';

class RecipeItemInfo extends StatelessWidget {
  const RecipeItemInfo({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        const SizedBox(
          width: 6,
        ),
        Text(text),
      ],
    );
  }
}
