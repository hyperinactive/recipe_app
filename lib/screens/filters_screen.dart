import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);
  static const String routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilters['gluten']!;
    _isLactoseFree = widget.currentFilters['lactose']!;
    _isVegan = widget.currentFilters['vegan']!;
    _isVegetarian = widget.currentFilters['vegetarian']!;

    super.initState();
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool currentValue,
    Function(bool)? callback,
  ) {
    return // switch tile -> label and switch button
        SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: callback,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtered'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedFilters = <String, bool>{
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegetarian': _isVegetarian,
                  'vegan': _isVegan
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Filter recipes',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          // take as much space as possible
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                  'gluten-free',
                  'include gluten-free recipes',
                  _isGlutenFree,
                  (bool newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  'lactose-free',
                  'include lactose-free recipes',
                  _isLactoseFree,
                  (bool newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  'vegetarian',
                  'include vegetarian recipes',
                  _isVegetarian,
                  (bool newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  'vegan',
                  'include vegan recipes',
                  _isVegan,
                  (bool newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(key: UniqueKey()),
    );
  }
}
