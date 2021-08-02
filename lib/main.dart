import 'package:flutter/material.dart';
import 'package:recipe_app/dummy_data.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/categories_screen.dart';
import 'package:recipe_app/screens/filters_screen.dart';
import 'package:recipe_app/screens/recipe_details_screen.dart';
import 'package:recipe_app/screens/recipes_screen.dart';
import 'package:recipe_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = <String, bool>{
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false
  };

  List<Recipe> _availableRecipes = dummyRecipes;
  List<Recipe> _favoriteRecipes = <Recipe>[];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableRecipes = dummyRecipes.where((Recipe element) {
        if (_filters['gluten'] != null &&
            _filters['gluten'] == true &&
            !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] != null &&
            _filters['lactose'] == true &&
            !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] != null &&
            _filters['vegetarian'] == true &&
            !element.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] != null &&
            _filters['vegan'] == true &&
            !element.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String id) {
    final int index =
        _favoriteRecipes.indexWhere((Recipe element) => element.id == id);
    // if the index of a favorite recipe has been found, remove it
    if (index >= 0) {
      setState(() {
        _favoriteRecipes.removeAt(index);
      });
      // else add it to the list
    } else {
      setState(() {
        _favoriteRecipes
            .add(dummyRecipes.firstWhere((Recipe element) => element.id == id));
      });
    }
  }

  bool _isFavorite(String id) {
    // any takes a function and runs it through the list
    // returns true if it finds anything that matches
    return _favoriteRecipes.any((Recipe element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      // blue gray theme
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.lightBlueAccent,
          canvasColor: const Color.fromRGBO(220, 251, 251, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Colors.black),
              bodyText2: const TextStyle(color: Colors.black, fontSize: 16),
              headline6: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ))),
      // home: Categories(key: UniqueKey()),
      // web routing
      initialRoute: '/', // doesn't do anything here, but whatev
      routes: <String, Widget Function(BuildContext)>{
        // '/': (BuildContext context) => Categories(key: UniqueKey()),
        // '/category-recipes': (BuildContext context) => const CategoryRecipe(),
        // use route names instead of route strings
        TabsScreen.routeName: (BuildContext context) => TabsScreen(
              key: UniqueKey(),
              favoriteRecipes: _favoriteRecipes,
            ),
        CategoriesScreen.routeName: (BuildContext context) =>
            CategoriesScreen(key: UniqueKey()),
        RecipesScreen.routeName: (BuildContext context) => RecipesScreen(
              availableRecipes: _availableRecipes,
            ),
        RecipeDetailsScreen.routeName: (BuildContext context) =>
            RecipeDetailsScreen(
              toggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        FiltersScreen.routeName: (BuildContext context) => FiltersScreen(
              saveFilters: _setFilters,
              currentFilters: _filters,
            )
      },
      // During normal app operation, the [onGenerateRoute] callback will only
      // be applied to route names pushed by the application, and so should never return null.
      // This is used if [routes] does not contain the requested route.
      onGenerateRoute: (RouteSettings settings) {
        print(settings);
        // can loop up route name, arguments... from the settings
        // return MaterialPageRoutes based on these
        // used for dynamic routing
        return MaterialPageRoute<void>(
            builder: (BuildContext context) => const CategoriesScreen());
      },
      // 404
      // when onGenerateRoute isn't defined it will fire off
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
            builder: (BuildContext context) => const CategoriesScreen());
      },
    );
  }
}
