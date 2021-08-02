import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  // Signature of callbacks that have no arguments and return no data.
  // use callback instead of function for callbacks
  Widget buildListTile(
      IconData iconData, String title, VoidCallback? callback) {
    return ListTile(
      leading: Icon(iconData, size: 26),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: callback,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'hello chief',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(Icons.restaurant, 'Recipes', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          // to avoid potentially infinite stack of pages being created (with no possibility of returning)
          // replace instead of pushing
          buildListTile(Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed('/filters');
          }),
        ],
      ),
    );
  }
}
