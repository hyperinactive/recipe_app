import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/recipe_details_screen.dart';
import 'package:recipe_app/widgets/recipe_item_info.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  void selectRecipe(BuildContext context) {
    Navigator.of(context)
        .pushNamed(RecipeDetailsScreen.routeName, arguments: id);
  }

  String get getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';

      default:
        return 'Unknown';
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';

      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectRecipe(context),
      child: Card(
        // check type required!!!
        // shape requires classes ShapeBorder
        // this is a common pattern to assign rounded corners
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // crops its child and forces itno a shape, in this case
                // parent's corner's are rounded
                // BorderRadius.only does the corner's individually
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  // Image.asset works with local images
                  // Image.network fetches one from a url
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity, // all available width
                    fit: BoxFit.cover, // contain, cover, fill, scaleDown...
                  ),
                ),
                // Positioned can be used inside Stack and its used to position elements
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    // make text smaller than the image by having it in a smaller container
                    width: 300,
                    // 54% transparent black
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      // wrap the text if it's too long for the widget to show
                      softWrap: true,
                      // if it's still too big to show, fade it out
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RecipeItemInfo(
                        icon: Icons.schedule, text: '$duration minutes'),
                    RecipeItemInfo(icon: Icons.work, text: getComplexity),
                    RecipeItemInfo(
                        icon: Icons.attach_money, text: getAffordability),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
