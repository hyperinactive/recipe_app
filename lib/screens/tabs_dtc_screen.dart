import 'package:flutter/material.dart';
import 'package:recipe_app/screens/categories_screen.dart';
import 'package:recipe_app/screens/favorites_screen.dart';

// DEPRECATED
// defaultTabsController setup
// doesn't require state managment
// tabs require the whole screen to work
class TabsDTCScreen extends StatelessWidget {
  const TabsDTCScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    // default tab controller with the scaffold as its chidl
    // tabbar at the bottom
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Recipes'),
              bottom: const TabBar(
                tabs: <Tab>[
                  Tab(icon: Icon(Icons.category), text: 'Categories'),
                  Tab(icon: Icon(Icons.star), text: 'Favorites'),
                ],
              ),
            ),
            // when using tabs like this, body need TabBarView
            body: const TabBarView(
              // as many children as there are tabs
              // each tab corresponds with the child and its intex
              children: <Widget>[
                CategoriesScreen(),
                FavoritesScreen(),
              ],
            )));
  }
}
