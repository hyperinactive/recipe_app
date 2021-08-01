import 'package:flutter/material.dart';
import 'package:recipe_app/screens/categories_screen.dart';
import 'package:recipe_app/screens/favorites_screen.dart';
import 'package:recipe_app/widgets/main_drawer.dart';

// tabs on the bottom
// tabs require the whole screen to work
class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // list of screens to show
  final List<Map<String, dynamic>> _tabScreens = <Map<String, dynamic>>[
    <String, dynamic>{'title': 'Recipes', 'screen': const CategoriesScreen()},
    <String, dynamic>{'title': 'Favorites', 'screen': const FavoritesScreen()},
  ];

  int _selectedTabIndex = 0;

  // remember, private class, private functions
  // flutter will automatically give the index of the selcted tab when selected
  // setState onTap and select the correct tab screen to show
  void _selectPage(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // default tab controller with the scaffold as its chidl
    // tabbar at the bottom
    return Scaffold(
      appBar: AppBar(
          title: Text(_tabScreens[_selectedTabIndex]['title'] as String)),
      // passing the selected tab screen
      drawer: MainDrawer(key: UniqueKey()),
      body: _tabScreens[_selectedTabIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor:
            Colors.white60, // change the colors of unselected items
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedTabIndex, // tells which tab is active
        selectedFontSize: 16,
        unselectedFontSize: 14,
        // when using type background colors must be set for the items
        // type: BottomNavigationBarType.shifting,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'recipes',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: 'favorites',
          ),
        ],
      ),
    );
  }
}
