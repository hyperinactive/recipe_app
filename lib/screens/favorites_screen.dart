import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // no need for a scaffold cause its a "subscreen" tab
    // the TabBar and TabBarView controll the appbar stuff already
    return const Center(
      child: Text('Favorites'),
    );
  }
}
