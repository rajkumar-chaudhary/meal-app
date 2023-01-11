import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meals_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> FavouriteMeals;
  FavouriteScreen(this.FavouriteMeals);
  //const FavouriteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FavouriteMeals.isEmpty) {
      return Center(
        child: Text('Tou have no favourites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, item) {
          return MealItem(
            id: FavouriteMeals[item].id,
            affordability: FavouriteMeals[item].affordability,
            complexity: FavouriteMeals[item].complexity,
            duration: FavouriteMeals[item].duration,
            imageUrl: FavouriteMeals[item].imageUrl,
            title: FavouriteMeals[item].title,
            //removeItem: _removeMeal,
          );
        },
        itemCount: FavouriteMeals.length,
      );
    }
  }
}
